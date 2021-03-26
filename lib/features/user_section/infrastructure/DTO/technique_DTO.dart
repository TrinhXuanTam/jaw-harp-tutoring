import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/errors/language_not_supported_error.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:optional/optional_internal.dart';

class TechniqueDTO extends Technique {
  final CategoryDTO category;
  final Optional<MediaDTO> thumbnail;
  final Optional<MediaDTO> video;

  const TechniqueDTO({
    required String id,
    Optional<DateTime> datePublished = const Optional.empty(),
    Optional<String> productId = const Optional.empty(),
    required this.category,
    required TechniqueDifficulty difficulty,
    this.thumbnail = const Optional.empty(),
    this.video = const Optional.empty(),
    required String title,
    required String description,
    required String accompanyingText,
  }) : super(
          id: id,
          datePublished: datePublished,
          productId: productId,
          category: category,
          difficulty: difficulty,
          thumbnail: thumbnail,
          video: video,
          title: title,
          description: description,
          accompanyingText: accompanyingText,
        );

  factory TechniqueDTO.fromEntity(Technique technique) {
    return TechniqueDTO(
      id: technique.id,
      category: CategoryDTO.fromEntity(technique.category),
      difficulty: technique.difficulty,
      title: technique.title,
      description: technique.description,
      accompanyingText: technique.accompanyingText,
    );
  }

  static TechniqueLocalizedDataDTO _getLocalizedData(DocumentSnapshot documentSnapshot) {
    final languageCode = FirebaseAuth.instance.languageCode;
    final Map<String, TechniqueLocalizedDataDTO> l10n = TechniqueLocalizedDataDTO.getLocalizedData(documentSnapshot);

    final localizedData = l10n[languageCode];
    if (localizedData != null)
      return localizedData;
    else {
      final defaultLocalizedData = l10n[ENGLISH_CODE];
      if (defaultLocalizedData == null) throw LanguageNotSupportedError();
      return defaultLocalizedData;
    }
  }

  static Future<TechniqueDTO> fromFirestore(DocumentSnapshot documentSnapshot) async {
    final localizedData = _getLocalizedData(documentSnapshot);
    final difficulty = TechniqueDifficulty.values[documentSnapshot["difficulty"]];
    final category = await CategoryDTO.fromFirestore(await FirebaseFirestore.instance.collection('categories').doc(documentSnapshot["category"]).get());

    return TechniqueDTO(
      id: documentSnapshot.id,
      datePublished: Optional<Timestamp>.ofNullable(documentSnapshot["datePublished"]).map((val) => val.toDate()),
      productId: Optional<String>.ofNullable(documentSnapshot["productId"]),
      category: category,
      difficulty: difficulty,
      thumbnail: await _getDownloadUrl(documentSnapshot, "thumbnail"),
      video: await _getDownloadUrl(documentSnapshot, "video"),
      title: localizedData.title,
      description: localizedData.description,
      accompanyingText: localizedData.accompanyingText,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      if (datePublished.isPresent) "datePublished": datePublished.value.toIso8601String(),
      if (productId.isPresent) "productId": productId.value,
      "category": category.toJson(),
      "difficulty": difficulty.index,
      if (thumbnail.isPresent) "thumbnail": thumbnail.value.toJson(),
      if (video.isPresent) "video": video.value.toJson(),
      "title": title,
      "description": description,
      "accompanyingText": accompanyingText,
    };
  }

  factory TechniqueDTO.fromJson(Map<String, dynamic> json) {
    return TechniqueDTO(
      id: json["id"],
      datePublished: json["datePublished"] != null ? Optional.of(DateTime.parse(json["datePublished"])) : Optional.empty(),
      productId: Optional.ofNullable(json["productId"]),
      category: CategoryDTO.fromJson(json["category"]),
      difficulty: TechniqueDifficulty.values[json["difficulty"]],
      thumbnail: json["thumbnail"] != null ? Optional.of(MediaDTO.fromJson(json["thumbnail"])) : Optional.empty(),
      video: json["video"] != null ? Optional.of(MediaDTO.fromJson(json["video"])) : Optional.empty(),
      title: json["title"],
      description: json["description"],
      accompanyingText: json["accompanyingText"],
    );
  }
}

Future<Optional<MediaDTO>> _getDownloadUrl(DocumentSnapshot documentSnapshot, String filename) async {
  try {
    final media = FirebaseStorage.instance.ref("techniques");
    return Optional.of(MediaDTO(url: Optional.of(await media.child(documentSnapshot.id).child(filename).getDownloadURL())));
  } catch (exception) {
    return Optional.empty();
  }
}
