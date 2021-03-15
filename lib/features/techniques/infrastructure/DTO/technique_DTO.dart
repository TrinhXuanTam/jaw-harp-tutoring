import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/mediaDTO.dart';
import 'package:jews_harp/features/techniques/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:optional/optional_internal.dart';

class TechniqueDTO extends Technique {
  const TechniqueDTO({
    required String id,
    Optional<String> productId = const Optional.empty(),
    required String categoryId,
    required TechniqueDifficulty difficulty,
    Optional<MediaDTO> thumbnail = const Optional.empty(),
    Optional<MediaDTO> video = const Optional.empty(),
    required Map<String, TechniqueLocalizedDataDTO> localizedData,
  }) : super(id: id, productId: productId, categoryId: categoryId, difficulty: difficulty, thumbnail: thumbnail, video: video, localizedData: localizedData);

  static Future<TechniqueDTO> fromFirestore(DocumentSnapshot documentSnapshot) async {
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
      thumbnail: await _getDownloadUrl(documentSnapshot, "thumbnail"),
      video: await _getDownloadUrl(documentSnapshot, "video"),
      localizedData: localizedData,
    );
  }
}

Future<Optional<MediaDTO>> _getDownloadUrl(DocumentSnapshot documentSnapshot, String filename) async {
  try {
    final media = FirebaseStorage.instance.ref("techniques");
    return Optional.of(MediaDTO(url: Optional.of(await media.child(documentSnapshot.id).child(filename).getDownloadURL())));
  } catch (exception) {
    return Optional.empty();
  }
}
