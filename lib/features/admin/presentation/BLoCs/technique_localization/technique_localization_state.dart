part of 'technique_localization_bloc.dart';

@immutable
abstract class TechniqueLocalizationState {}

/// Initial state.
class TechniqueLocalizationLoading extends TechniqueLocalizationState {}

/// Technique localization loaded.
class TechniqueLocalizationLoaded extends TechniqueLocalizationState {
  final Map<String, TechniqueLocalizedData> localizedData;

  TechniqueLocalizationLoaded(this.localizedData);
}
