import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/errors/language_not_supported_error.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/product_info_DTO.dart';
import 'package:optional/optional_internal.dart';

/// Technique DTO
class TechniqueDTO extends Technique {
  final CategoryDTO category;
  final Optional<MediaDTO> thumbnail;
  final Optional<MediaDTO> video;
  final ProductInfoDTO productInfo;

  const TechniqueDTO({
    required String id,
    Optional<DateTime> datePublished = const Optional.empty(),
    Optional<String> productId = const Optional.empty(),
    required this.productInfo,
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
          productInfo: productInfo,
          category: category,
          difficulty: difficulty,
          thumbnail: thumbnail,
          video: video,
          title: title,
          description: description,
          accompanyingText: accompanyingText,
        );

  /// Extract localized data from Firestore document.
  static Map<String, dynamic> _getLocalizedData(DocumentSnapshot documentSnapshot) {
    final languageCode = FirebaseAuth.instance.languageCode;

    final localizedData = documentSnapshot["localization"][languageCode];
    if (localizedData != null)
      return localizedData;
    else {
      final defaultLocalizedData = documentSnapshot["localization"][ENGLISH_CODE];
      if (defaultLocalizedData == null) throw LanguageNotSupportedError();
      return defaultLocalizedData;
    }
  }

  /// Get download url for displaying thumbnail and videos.
  static Future<Optional<MediaDTO>> _getDownloadUrl(DocumentSnapshot documentSnapshot, String filename) async {
    try {
      final media = FirebaseStorage.instance.ref("techniques");
      final url = await media.child(documentSnapshot.id).child(filename).getDownloadURL();
      return Optional.of(MediaDTO(url: Optional.of(url)));
    } catch (exception) {
      return Optional.empty();
    }
  }

  /// Creates a copy of this object with given params.
  TechniqueDTO copyWith({
    String? id,
    Optional<DateTime>? datePublished,
    Optional<String>? productId,
    ProductInfoDTO? productInfo,
    CategoryDTO? category,
    TechniqueDifficulty? difficulty,
    Optional<MediaDTO>? thumbnail,
    Optional<MediaDTO>? video,
    String? title,
    String? description,
    String? accompanyingText,
  }) {
    return TechniqueDTO(
      id: id ?? this.id,
      datePublished: datePublished ?? this.datePublished,
      productId: productId ?? this.productId,
      productInfo: productInfo ?? this.productInfo,
      category: category ?? this.category,
      difficulty: difficulty ?? this.difficulty,
      thumbnail: thumbnail ?? this.thumbnail,
      video: video ?? this.video,
      title: title ?? this.title,
      description: description ?? this.description,
      accompanyingText: accompanyingText ?? this.accompanyingText,
    );
  }

  /// Create technique from entity.
  factory TechniqueDTO.fromEntity(Technique technique) {
    return TechniqueDTO(
      id: technique.id,
      datePublished: technique.datePublished,
      productId: technique.productId,
      productInfo: ProductInfoDTO.fromEntity(technique.productInfo),
      category: CategoryDTO.fromEntity(technique.category),
      difficulty: technique.difficulty,
      thumbnail: technique.thumbnail.map((t) => MediaDTO.fromEntity(t)),
      video: technique.video.map((v) => MediaDTO.fromEntity(v)),
      title: technique.title,
      description: technique.description,
      accompanyingText: technique.accompanyingText,
    );
  }

  /// Create technique from Firestore document.
  static Future<TechniqueDTO> fromFirestore(DocumentSnapshot documentSnapshot) async {
    final firestoreConnection = FirebaseFirestore.instance;
    final localizedData = _getLocalizedData(documentSnapshot);
    final category = await CategoryDTO.fromFirestore(await firestoreConnection.collection('categories').doc(documentSnapshot["category"]).get());
    final productId = Optional<String>.ofNullable(documentSnapshot["productId"]);

    return TechniqueDTO(
      id: documentSnapshot.id,
      datePublished: Optional<Timestamp>.ofNullable(documentSnapshot["datePublished"]).map((val) => val.toDate()),
      productId: productId,
      productInfo: await ProductInfoDTO.fromProductId(productId.toNullable()),
      category: category,
      difficulty: TechniqueDifficulty.values[documentSnapshot["difficulty"]],
      thumbnail: await _getDownloadUrl(documentSnapshot, "thumbnail"),
      video: await _getDownloadUrl(documentSnapshot, "video"),
      title: localizedData["title"],
      description: localizedData["description"],
      accompanyingText: localizedData["accompanyingText"],
    );
  }

  /// Convert technique to json format.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      if (datePublished.isPresent) "datePublished": datePublished.value.toIso8601String(),
      if (productId.isPresent) "productId": productId.value,
      "productInfo": productInfo.toJson(),
      "category": category.toJson(),
      "difficulty": difficulty.index,
      if (thumbnail.isPresent) "thumbnail": thumbnail.value.toJson(),
      if (video.isPresent) "video": video.value.toJson(),
      "title": title,
      "description": description,
      "accompanyingText": accompanyingText,
    };
  }

  /// Load technique from json format.
  factory TechniqueDTO.fromJson(Map<String, dynamic> json) {
    return TechniqueDTO(
      id: json["id"],
      datePublished: json["datePublished"] != null ? Optional.of(DateTime.parse(json["datePublished"])) : Optional.empty(),
      productId: Optional.ofNullable(json["productId"]),
      productInfo: ProductInfoDTO.fromJson(json["productInfo"]),
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
