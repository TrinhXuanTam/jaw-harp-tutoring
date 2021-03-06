import 'package:equatable/equatable.dart';

import 'category_localized_data.dart';

class Category extends Equatable {
  final String id;
  final bool isVisible;
  final List<String> techniqueIds;
  final Map<String, CategoryLocalizedData> localizedData;

  String getLocalizedTitle(String languageCode) {
    if (!localizedData.containsKey(languageCode))
      return localizedData["en"].title;
    else
      return localizedData[languageCode].title;
  }

  String getLocalizedDescription(String languageCode) {
    if (!localizedData.containsKey(languageCode))
      return localizedData["en"].description;
    else
      return localizedData[languageCode].description;
  }

  Category(this.id, this.isVisible, this.techniqueIds, this.localizedData);

  @override
  List<Object> get props => [id, isVisible, techniqueIds, localizedData];
}
