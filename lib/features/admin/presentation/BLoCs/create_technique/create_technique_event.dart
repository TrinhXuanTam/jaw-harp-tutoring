part of 'create_technique_bloc.dart';

@immutable
abstract class CreateTechniqueEvent {}

class AddTechniqueLocalizationEvent extends CreateTechniqueEvent {
  final TechniqueLocalizedData techniqueLocalizedData;

  AddTechniqueLocalizationEvent(this.techniqueLocalizedData);
}

class EditTechniqueLocalizationEvent extends CreateTechniqueEvent {
  final TechniqueLocalizedData techniqueLocalizedData;

  EditTechniqueLocalizationEvent(this.techniqueLocalizedData);
}

class RemoveTechniqueLocalizationEvent extends CreateTechniqueEvent {
  final String languageCode;

  RemoveTechniqueLocalizationEvent(this.languageCode);
}

class CreateTechniqueFormSubmittedEvent extends CreateTechniqueEvent {}
