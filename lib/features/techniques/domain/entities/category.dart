import 'package:equatable/equatable.dart';

import 'category_localized_data.dart';

class Category extends Equatable {
  final String id;
  final bool isVisible;
  final Map<String, CategoryLocalizedData> localizedData;

  Category(this.id, this.isVisible, this.localizedData);

  @override
  List<Object> get props => [id, isVisible];
}
