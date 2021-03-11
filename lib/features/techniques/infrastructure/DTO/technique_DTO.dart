import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';

class TechniqueDTO extends Technique {
  const TechniqueDTO({
    required String productId,
    required String categoryId,
    required TechniqueDifficulty difficulty,
    String? thumbnailUrl,
    String? videoUrl,
    required Map<String, TechniqueLocalizedDataDTO> localizedData,
  }) : super(productId: productId, categoryId: categoryId, difficulty: difficulty, thumbnailUrl: thumbnailUrl, videoUrl: videoUrl, localizedData: localizedData);

  factory TechniqueDTO.fromFirestore(DocumentSnapshot documentSnapshot) {
    final Map<String, TechniqueLocalizedDataDTO> localizedData = {};
    final difficulty = TechniqueDifficulty.values[documentSnapshot["difficulty"]];
    documentSnapshot.data()?["localization"].forEach(
          (key, value) => localizedData[key] = TechniqueLocalizedDataDTO(
            languageCode: key,
            title: value["title"],
            description: value["description"],
            accompanyingText: value["accompanyingText"],
          ),
        );

    return TechniqueDTO(
      productId: documentSnapshot.id,
      categoryId: documentSnapshot["category"],
      difficulty: difficulty,
      thumbnailUrl: documentSnapshot["thumbnailUrl"],
      videoUrl: documentSnapshot["videoUrl"],
      localizedData: localizedData,
    );
  }
}
