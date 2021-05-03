import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/errors/language_not_supported_error.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:optional/optional.dart';

/// Category DTO
class CategoryDTO extends Category {
  final Optional<MediaDTO> thumbnail;

  const CategoryDTO({
    required String id,
    required bool isVisible,
    required List<String> techniqueIds,
    this.thumbnail = const Optional.empty(),
    required String title,
    required String description,
  }) : super(id: id, isVisible: isVisible, thumbnail: thumbnail, techniqueIds: techniqueIds, title: title, description: description);

  /// Extract localized data from Firestore document.
  static Map<String, dynamic> _getLocalizedData(DocumentSnapshot documentSnapshot) {
    final languageCode = FirebaseAuth.instance.languageCode;
    final localizedData = documentSnapshot["localization"][languageCode];

    if (localizedData != null)
      return localizedData;
    else {
      // Get english localization if language is not supported.
      final defaultLocalizedData = documentSnapshot["localization"][ENGLISH_CODE];
      if (defaultLocalizedData == null) throw LanguageNotSupportedError();
      return defaultLocalizedData;
    }
  }

  /// Get download url for displaying thumbnail.
  static Future<Optional<MediaDTO>> _getDownloadUrl(DocumentSnapshot documentSnapshot, String filename) async {
    try {
      final media = FirebaseStorage.instance.ref("categories");
      final downloadUrl = await media.child(documentSnapshot.id).child(filename).getDownloadURL();
      return Optional.of(MediaDTO(url: Optional.of(downloadUrl)));
    } catch (exception) {
      // Return [Optional.empty()] if file does not exist.
      return Optional.empty();
    }
  }

  /// Create DTO from entity.
  factory CategoryDTO.fromEntity(Category category) {
    return CategoryDTO(
      id: category.id,
      isVisible: category.isVisible,
      techniqueIds: category.techniqueIds,
      thumbnail: category.thumbnail.map((e) => MediaDTO.fromEntity(e)),
      title: category.title,
      description: category.description,
    );
  }

  /// Create DTO from Firestore document.
  static Future<CategoryDTO> fromFirestore(DocumentSnapshot documentSnapshot) async {
    final localizedData = _getLocalizedData(documentSnapshot);

    return CategoryDTO(
      id: documentSnapshot.id,
      isVisible: documentSnapshot["isVisible"],
      techniqueIds: List<String>.from(documentSnapshot["techniques"]),
      thumbnail: await _getDownloadUrl(documentSnapshot, "thumbnail"),
      title: localizedData["title"],
      description: localizedData["description"],
    );
  }

  /// Convert DTO to json format.
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "isVisible": isVisible,
      "techniqueIds": techniqueIds,
      if (thumbnail.isPresent) "thumbnail": thumbnail.value.toJson(),
      "title": title,
      "description": description,
    };
  }

  /// Load CategoryDTO from json format.
  factory CategoryDTO.fromJson(Map<String, dynamic> json) {
    return CategoryDTO(
      id: json["id"],
      isVisible: json["isVisible"],
      techniqueIds: List<String>.from(json["techniqueIds"]),
      thumbnail: json["thumbnail"] != null ? Optional.of(MediaDTO.fromJson(json["thumbnail"])) : Optional.empty(),
      title: json["title"],
      description: json["description"],
    );
  }
}
