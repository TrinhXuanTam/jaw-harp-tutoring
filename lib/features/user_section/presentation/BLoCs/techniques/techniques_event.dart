part of 'techniques_bloc.dart';

@immutable
abstract class TechniquesEvent {}

class LoadTechniquesByCategory extends TechniquesEvent {
  final Category category;

  LoadTechniquesByCategory(this.category);
}
