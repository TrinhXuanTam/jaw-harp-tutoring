import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';

class TechniqueDTO extends Technique {
  final String id;
  final String categoryId;
  final TechniqueDifficulty difficulty;
  final String? thumbnailUrl;
  final String? videoUrl;
  final Map<String, TechniqueLocalizedDataDTO> localizedData;

  TechniqueDTO(this.id, this.categoryId, this.difficulty, this.thumbnailUrl, this.videoUrl, this.localizedData)
      : super(
          id: id,
          categoryId: categoryId,
          difficulty: difficulty,
          thumbnailUrl: thumbnailUrl,
          videoUrl: videoUrl,
          localizedData: localizedData,
        );

  factory TechniqueDTO.fromFirestore(DocumentSnapshot documentSnapshot) {
    final Map<String, TechniqueLocalizedDataDTO> localizedData = {};
    final difficulty = TechniqueDifficulty.values[documentSnapshot["difficulty"]];
    documentSnapshot.data()?["localization"].forEach((key, value) => localizedData[key] = TechniqueLocalizedDataDTO(key, value["title"], value["description"], value["accompanyingText"]));
    return TechniqueDTO(documentSnapshot.id, documentSnapshot["categoryId"], difficulty, documentSnapshot["thumbnailUrl"], documentSnapshot["videoUrl"], localizedData);
  }
}
