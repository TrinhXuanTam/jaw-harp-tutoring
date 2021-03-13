import 'package:equatable/equatable.dart';

class CategoryLocalizedData extends Equatable {
  final String languageCode;
  final String title;
  final String description;

  const CategoryLocalizedData({
    required this.languageCode,
    this.title = "",
    this.description = "",
  });

  @override
  List<Object> get props => [languageCode, title, description];
}
