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

class CreateTechniqueFormSubmittedEvent extends CreateTechniqueEvent {
  final String id;
  final String categoryId;
  final TechniqueDifficulty difficulty;
  final File? thumbnail;
  final File? video;

  CreateTechniqueFormSubmittedEvent({
    required this.id,
    required this.categoryId,
    required this.difficulty,
    this.thumbnail,
    this.video,
  });
}
