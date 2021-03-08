import 'package:equatable/equatable.dart';

class TechniqueLocalizedData extends Equatable {
  final String languageCode;
  final String title;
  final String description;
  final String accompanyingText;

  TechniqueLocalizedData(
    this.languageCode,
    this.title,
    this.description,
    this.accompanyingText,
  );

  @override
  List<Object> get props => [languageCode, title, description, accompanyingText];
}
