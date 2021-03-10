import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

class TechniqueLocalizedDataDTO extends TechniqueLocalizedData {
  const TechniqueLocalizedDataDTO({
    required String languageCode,
    required String title,
    required String description,
    required String accompanyingText,
  }) : super(languageCode: languageCode, title: title, description: description, accompanyingText: accompanyingText);

  factory TechniqueLocalizedDataDTO.fromCategoryLocalizedData(TechniqueLocalizedData localizedData) {
    return TechniqueLocalizedDataDTO(
      languageCode: localizedData.languageCode,
      title: localizedData.title,
      description: localizedData.description,
      accompanyingText: localizedData.accompanyingText,
    );
  }
}

extension Serializable on Iterable<TechniqueLocalizedDataDTO> {
  Map<String, Map<String, String>> toJson() {
    final Map<String, Map<String, String>> localization = {};
    this.forEach(
      (element) => localization[element.languageCode] = {
        "title": element.title,
        "description": element.description,
        "accompanyingText": element.accompanyingText,
      },
    );

    return localization;
  }
}

extension Conversion on Iterable<TechniqueLocalizedData> {
  Iterable<TechniqueLocalizedDataDTO> toDTO() => this.map((e) => TechniqueLocalizedDataDTO.fromCategoryLocalizedData(e));
}
