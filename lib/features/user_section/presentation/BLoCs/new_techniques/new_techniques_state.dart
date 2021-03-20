part of 'new_techniques_bloc.dart';

@immutable
abstract class NewTechniquesState {}

class NewTechniquesLoading extends NewTechniquesState {}

class NewTechniquesLoaded extends NewTechniquesState {
  final List<Technique> techniques;

  NewTechniquesLoaded(this.techniques);
}
