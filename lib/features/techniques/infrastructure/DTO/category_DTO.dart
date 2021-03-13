import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

import 'category_localized_data_DTO.dart';

class CategoryDTO extends Category {
  const CategoryDTO({
    required String id,
    required bool isVisible,
    required List<String> techniqueIds,
    required Map<String, CategoryLocalizedDataDTO> localizedData,
  }) : super(id: id, isVisible: isVisible, techniqueIds: techniqueIds, localizedData: localizedData);

  factory CategoryDTO.fromEntity(Category category) {
    return CategoryDTO(
      id: category.id,
      isVisible: category.isVisible,
      techniqueIds: category.techniqueIds,
      localizedData: category.localizedData.map((key, value) => MapEntry(key, CategoryLocalizedDataDTO.fromEntity(value))),
    );
  }

  factory CategoryDTO.fromFirestore(DocumentSnapshot documentSnapshot) {
    final Map<String, CategoryLocalizedDataDTO> localizedData = {};
    documentSnapshot.data()?["localization"].forEach(
          (key, value) => localizedData[key] = CategoryLocalizedDataDTO(
            languageCode: key,
            title: value["title"],
            description: value["description"],
          ),
        );

    return CategoryDTO(
      id: documentSnapshot.id,
      isVisible: documentSnapshot["isVisible"],
      techniqueIds: List<String>.from(documentSnapshot["techniques"]),
      localizedData: localizedData,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "isVisible": this.isVisible,
      "techniques": FieldValue.arrayUnion(this.techniqueIds),
      "localization": this.localizedData.map(
            (key, value) => MapEntry(
              key,
              {
                "title": value.title,
                "description": value.description,
              },
            ),
          ),
    };
  }
}
