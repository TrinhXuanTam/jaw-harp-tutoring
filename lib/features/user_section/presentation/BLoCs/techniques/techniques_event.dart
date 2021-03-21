part of 'techniques_bloc.dart';

@immutable
abstract class TechniquesEvent {}

class LoadTechniquesByCategory extends TechniquesEvent {
  final Category category;

  LoadTechniquesByCategory(this.category);
}

class LoadAllTechniques extends TechniquesEvent {}

class TextSearchPerformed extends TechniquesEvent {
  final String keywords;

  TextSearchPerformed(this.keywords);
}
