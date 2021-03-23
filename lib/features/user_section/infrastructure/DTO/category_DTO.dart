import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/errors/language_not_supported_error.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:optional/optional.dart';

import 'category_localized_data_DTO.dart';

class CategoryDTO extends Category {
  const CategoryDTO({
    required String id,
    required bool isVisible,
    required List<String> techniqueIds,
    Optional<Media> thumbnail = const Optional.empty(),
    required String title,
    required String description,
  }) : super(id: id, isVisible: isVisible, thumbnail: thumbnail, techniqueIds: techniqueIds, title: title, description: description);

  static CategoryLocalizedDataDTO _getLocalizedData(DocumentSnapshot documentSnapshot) {
    final languageCode = FirebaseAuth.instance.languageCode;
    final l10n = CategoryLocalizedDataDTO.getLocalizedData(documentSnapshot);

    final localizedData = l10n[languageCode];
    if (localizedData != null)
      return localizedData;
    else {
      final defaultLocalizedData = l10n[ENGLISH_CODE];
      if (defaultLocalizedData == null) throw LanguageNotSupportedError();
      return defaultLocalizedData;
    }
  }

  factory CategoryDTO.fromEntity(Category category) {
    return CategoryDTO(
      id: category.id,
      isVisible: category.isVisible,
      techniqueIds: category.techniqueIds,
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
      title: localizedData.title,
      description: localizedData.description,
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
