import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';

/// DTO for category localized data.
class CategoryLocalizedDataDTO extends CategoryLocalizedData {
  const CategoryLocalizedDataDTO({
    required String languageCode,
    required String title,
    required String description,
  }) : super(languageCode: languageCode, title: title, description: description);

  /// Get category localized data from category Firebase document.
  static Map<String, CategoryLocalizedDataDTO> getLocalizedData(DocumentSnapshot documentSnapshot) {
    final Map<String, CategoryLocalizedDataDTO> l10n = {};
    documentSnapshot["localization"].forEach(
      (key, value) => l10n[key] = CategoryLocalizedDataDTO(
        languageCode: key,
        title: value["title"],
        description: value["description"],
      ),
    );

    return l10n;
  }

  /// Create DTO from entity.
  factory CategoryLocalizedDataDTO.fromEntity(CategoryLocalizedData localizedData) {
    return CategoryLocalizedDataDTO(
      languageCode: localizedData.languageCode,
      title: localizedData.title,
      description: localizedData.description,
    );
  }
}
