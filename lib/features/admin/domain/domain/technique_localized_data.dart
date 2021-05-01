import 'package:equatable/equatable.dart';

/// Entity that encompasses localized data for techniques.
class TechniqueLocalizedData extends Equatable {
  final String languageCode;
  final String title;
  final String description;
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
