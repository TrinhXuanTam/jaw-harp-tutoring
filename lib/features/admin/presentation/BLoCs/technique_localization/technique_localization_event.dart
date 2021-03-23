part of 'technique_localization_bloc.dart';

@immutable
abstract class TechniqueLocalizationEvent {}

class LoadTechniqueLocalizedData extends TechniqueLocalizationEvent {
  final Technique technique;

  LoadTechniqueLocalizedData(this.technique);
}
