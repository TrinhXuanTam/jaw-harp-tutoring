import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

class TechniqueLocalizedDataDTO extends TechniqueLocalizedData {
  final String languageCode;
  final String title;
  final String description;
  final String accompanyingText;

  TechniqueLocalizedDataDTO(this.languageCode, this.title, this.description, this.accompanyingText) : super(languageCode, title, description, accompanyingText);

  factory TechniqueLocalizedDataDTO.fromCategoryLocalizedData(TechniqueLocalizedData localizedData) {
    return TechniqueLocalizedDataDTO(localizedData.languageCode, localizedData.title, localizedData.description, localizedData.accompanyingText);
  }
}
