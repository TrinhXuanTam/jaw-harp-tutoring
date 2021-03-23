part of 'technique_localization_bloc.dart';

@immutable
abstract class TechniqueLocalizationState {}

class TechniqueLocalizationLoading extends TechniqueLocalizationState {}

class TechniqueLocalizationLoaded extends TechniqueLocalizationState {
  final Map<String, TechniqueLocalizedData> localizedData;

  TechniqueLocalizationLoaded(this.localizedData);
}
