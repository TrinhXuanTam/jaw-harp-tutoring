import 'package:equatable/equatable.dart';
import 'package:jews_harp/core/constants/language_codes.dart';

import 'category_localized_data.dart';

class Category extends Equatable {
  final String id;
  final bool isVisible;
  final List<String> techniqueIds;
  final Map<String, CategoryLocalizedData> localizedData;

  String getLocalizedTitle(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData[ENGLISH_CODE]!.title;

    return data.title;
  }

  String getLocalizedDescription(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData[ENGLISH_CODE]!.description;

    return data.description;
  }

  const Category({
    required this.id,
    required this.isVisible,
    required this.techniqueIds,
    required this.localizedData,
  });

  @override
  List<Object> get props => [id, isVisible, techniqueIds, localizedData];
}
