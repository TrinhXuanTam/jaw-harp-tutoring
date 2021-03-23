import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';

class CategoryLocalizedDataDTO extends CategoryLocalizedData {
  const CategoryLocalizedDataDTO({
    required String languageCode,
    required String title,
    required String description,
  }) : super(languageCode: languageCode, title: title, description: description);

  static Map<String, CategoryLocalizedDataDTO> getLocalizedData(DocumentSnapshot documentSnapshot) {
    final Map<String, CategoryLocalizedDataDTO> l10n = {};
    documentSnapshot.data()?["localization"].forEach(
          (key, value) => l10n[key] = CategoryLocalizedDataDTO(
            languageCode: key,
            title: value["title"],
            description: value["description"],
          ),
        );

    return l10n;
  }

  factory CategoryLocalizedDataDTO.fromEntity(CategoryLocalizedData localizedData) {
    return CategoryLocalizedDataDTO(
      languageCode: localizedData.languageCode,
      title: localizedData.title,
      description: localizedData.description,
    );
  }
}

extension Serializable on Iterable<CategoryLocalizedDataDTO> {
  Map<String, Map<String, String>> toJson() {
    final Map<String, Map<String, String>> localization = {};
    this.forEach(
      (element) => localization[element.languageCode] = {
        "title": element.title,
        "description": element.description,
      },
    );

    return localization;
  }
}

extension Conversion on Iterable<CategoryLocalizedData> {
  Iterable<CategoryLocalizedDataDTO> toDTO() => this.map((e) => CategoryLocalizedDataDTO.fromEntity(e));
}
