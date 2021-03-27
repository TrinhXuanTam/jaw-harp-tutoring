part of 'technique_bloc.dart';

@immutable
abstract class TechniqueEvent {}

class LoadTechnique extends TechniqueEvent {
  final String id;

  LoadTechnique(this.id);
}
