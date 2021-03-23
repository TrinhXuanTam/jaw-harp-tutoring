part of 'techniques_bloc.dart';

@immutable
abstract class TechniquesEvent {
  const TechniquesEvent();
}

class LoadTechniquesByCategory extends TechniquesEvent {
  final Category category;

  LoadTechniquesByCategory(this.category);
}

class LoadNewTechniques extends TechniquesEvent {}

class LoadAllTechniques extends TechniquesEvent {
  const LoadAllTechniques();
}

class TextSearchPerformed extends TechniquesEvent {
  final String keywords;

  TextSearchPerformed(this.keywords);
}

class FilterUpdated extends TechniquesEvent {
  final String searchKeywords;
  final Optional<TechniqueOrder> techniqueOrder;
  final bool descending;

  FilterUpdated({
    this.searchKeywords = "",
    this.techniqueOrder = const Optional.empty(),
    this.descending = false,
  });
}
