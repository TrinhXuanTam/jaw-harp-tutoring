import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';

/// DTO for technique localized data.
class TechniqueLocalizedDataDTO extends TechniqueLocalizedData {
  const TechniqueLocalizedDataDTO({
    required String languageCode,
    required String title,
    required String description,
    required String accompanyingText,
  }) : super(languageCode: languageCode, title: title, description: description, accompanyingText: accompanyingText);

  /// Get technique localized data from technique Firebase document.
  static Map<String, TechniqueLocalizedDataDTO> getLocalizedData(DocumentSnapshot documentSnapshot) {
    final Map<String, TechniqueLocalizedDataDTO> l10n = {};
    documentSnapshot["localization"].forEach(
          (key, value) => l10n[key] = TechniqueLocalizedDataDTO(
            languageCode: key,
            title: value["title"],
            description: value["description"],
            accompanyingText: value["accompanyingText"],
          ),
        );
    return l10n;
  }

  /// Create DTO from entity.
  factory TechniqueLocalizedDataDTO.fromEntity(TechniqueLocalizedData localizedData) {
    return TechniqueLocalizedDataDTO(
      languageCode: localizedData.languageCode,
      title: localizedData.title,
      description: localizedData.description,
      accompanyingText: localizedData.accompanyingText,
    );
  }
}
