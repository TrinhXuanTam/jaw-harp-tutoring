part of 'technique_form_bloc.dart';

@immutable
abstract class TechniqueFormEvent {}

class UpdateTechniquePricing extends TechniqueFormEvent {
  final bool isPaid;

  UpdateTechniquePricing(this.isPaid);
}

class UpdateTechniqueLocalization extends TechniqueFormEvent {
  final TechniqueLocalizedData techniqueLocalizedData;

  UpdateTechniqueLocalization(this.techniqueLocalizedData);
}

class RemoveTechniqueLocalization extends TechniqueFormEvent {
  final String languageCode;

  RemoveTechniqueLocalization(this.languageCode);
}

class CreateTechniqueEvent extends TechniqueFormEvent {}

class UpdateTechniqueEvent extends TechniqueFormEvent {
  final Technique technique;

  UpdateTechniqueEvent(this.technique);
}
