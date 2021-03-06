import 'package:equatable/equatable.dart';

import 'category_localized_data.dart';

class Category extends Equatable {
  final String id;
  final bool isVisible;
  final List<String> techniqueIds;
  final Map<String, CategoryLocalizedData> localizedData;

  String getLocalizedTitle(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData["en"]!.title;

    return data.title;
  }

  String getLocalizedDescription(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData["en"]!.description;

    return data.description;
  }

  Category(this.id, this.isVisible, this.techniqueIds, this.localizedData);

  @override
  List<Object> get props => [id, isVisible, techniqueIds, localizedData];
}
