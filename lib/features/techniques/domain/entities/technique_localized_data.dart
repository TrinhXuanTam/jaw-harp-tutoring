import 'package:equatable/equatable.dart';

class TechniqueLocalizedData extends Equatable {
  final String languageCode;
  final String title;
  final String briefDescription;
  final String detailedDescription;

  TechniqueLocalizedData(
    this.languageCode,
    this.title,
    this.briefDescription,
    this.detailedDescription,
  );

  @override
  List<Object> get props => [languageCode, title, briefDescription, detailedDescription];
}
