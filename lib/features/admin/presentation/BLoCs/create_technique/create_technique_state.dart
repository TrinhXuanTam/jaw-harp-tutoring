part of 'create_technique_bloc.dart';

@immutable
abstract class CreateTechniqueState {}

class CreateTechniqueNotFinishedState extends CreateTechniqueState {}

class CreateTechniqueFinishedState extends CreateTechniqueState {}