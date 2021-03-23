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
  const TechniqueDTO({
    required String id,
    Optional<DateTime> datePublished = const Optional.empty(),
    Optional<String> productId = const Optional.empty(),
    required CategoryDTO category,
    required TechniqueDifficulty difficulty,
    Optional<MediaDTO> thumbnail = const Optional.empty(),
    Optional<MediaDTO> video = const Optional.empty(),
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

  static TechniqueLocalizedDataDTO _getLocalizedData(DocumentSnapshot documentSnapshot) {
    final languageCode = FirebaseAuth.instance.languageCode;

    final Map<String, TechniqueLocalizedDataDTO> l10n = {};
    documentSnapshot.data()?["localization"].forEach(
          (key, value) => l10n[key] = TechniqueLocalizedDataDTO(
            languageCode: key,
            title: value["title"],
            description: value["description"],
            accompanyingText: value["accompanyingText"],
          ),
        );

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
    final category = CategoryDTO.fromFirestore(await FirebaseFirestore.instance.collection('categories').doc(documentSnapshot["category"]).get());

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
}

Future<Optional<MediaDTO>> _getDownloadUrl(DocumentSnapshot documentSnapshot, String filename) async {
  try {
    final media = FirebaseStorage.instance.ref("techniques");
    return Optional.of(MediaDTO(url: Optional.of(await media.child(documentSnapshot.id).child(filename).getDownloadURL())));
  } catch (exception) {
    return Optional.empty();
  }
}
