import 'package:equatable/equatable.dart';

/// Entity that encompasses localized data for categories.
class CategoryLocalizedData extends Equatable {
  /// The language of the contained data.
  final String languageCode;

  /// Title of the category.
  final String title;

  /// A brief description of the category.
  final String description;

  const CategoryLocalizedData({
    required this.languageCode,
    this.title = "",
    this.description = "",
  });

  @override
  List<Object> get props => [languageCode, title, description];
}
