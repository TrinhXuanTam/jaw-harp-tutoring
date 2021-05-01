import 'package:equatable/equatable.dart';

/// Entity that encompasses localized data for techniques.
class TechniqueLocalizedData extends Equatable {
  /// The language of the contained data.
  final String languageCode;

  /// Title of the technique.
  final String title;

  /// A brief description of the category.
  final String description;

  /// The accompanying text to the technique video.
  final String accompanyingText;

  const TechniqueLocalizedData({
    required this.languageCode,
    this.title = "",
    this.description = "",
    this.accompanyingText = "",
  });

  @override
  List<Object> get props => [languageCode, title, description, accompanyingText];
}
