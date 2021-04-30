import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/errors/language_not_supported_error.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:optional/optional.dart';

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

Future<Optional<MediaDTO>> _getDownloadUrl(DocumentSnapshot documentSnapshot, String filename) async {
  try {
    final media = FirebaseStorage.instance.ref("categories");
    return Optional.of(MediaDTO(url: Optional.of(await media.child(documentSnapshot.id).child(filename).getDownloadURL())));
  } catch (exception) {
    return Optional.empty();
  }
}
