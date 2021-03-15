import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:optional/optional_internal.dart';

class TechniqueDTO extends Technique {
  const TechniqueDTO({
    required String id,
    Optional<String> productId = const Optional.empty(),
    required String categoryId,
    required TechniqueDifficulty difficulty,
    Optional<String> thumbnailUrl = const Optional.empty(),
    Optional<String> videoUrl = const Optional.empty(),
    required Map<String, TechniqueLocalizedDataDTO> localizedData,
  }) : super(id: id, productId: productId, categoryId: categoryId, difficulty: difficulty, thumbnailUrl: thumbnailUrl, videoUrl: videoUrl, localizedData: localizedData);

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
      id: documentSnapshot.id,
      productId: Optional<String>.ofNullable(documentSnapshot["productId"]),
      categoryId: documentSnapshot["category"],
      difficulty: difficulty,
      thumbnailUrl: Optional<String>.ofNullable(documentSnapshot["thumbnailUrl"]),
      videoUrl: Optional<String>.ofNullable(documentSnapshot["videoUrl"]),
      localizedData: localizedData,
    );
  }
}
