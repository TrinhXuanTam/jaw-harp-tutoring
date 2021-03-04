import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';

class CategoryLocalizedDataDTO extends CategoryLocalizedData {
  CategoryLocalizedDataDTO(String languageCode, String title, String description) : super(languageCode, title, description);

  factory CategoryLocalizedDataDTO.fromCategoryLocalizedData(CategoryLocalizedData localizedData) {
    return CategoryLocalizedDataDTO(localizedData.languageCode, localizedData.title, localizedData.description);
  }
}
