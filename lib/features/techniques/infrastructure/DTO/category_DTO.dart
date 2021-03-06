import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

import 'category_localized_data_DTO.dart';

class CategoryDTO extends Category {
  final Map<String, CategoryLocalizedDataDTO> localizedData;

  CategoryDTO(String id, bool isVisible, List<String> techniqueIds, this.localizedData) : super(id, isVisible, techniqueIds, localizedData);

  factory CategoryDTO.fromFirestore(DocumentSnapshot documentSnapshot) {
    final Map<String, dynamic> localization = documentSnapshot.data()!["localization"];
    final Map<String, CategoryLocalizedDataDTO> localizedData = {};
    localization.forEach((key, value) => localizedData[key] = CategoryLocalizedDataDTO(key, value["title"], value["description"]));
    return CategoryDTO(documentSnapshot.id, documentSnapshot["isVisible"], List<String>.from(documentSnapshot["techniques"]), localizedData);
  }
}
