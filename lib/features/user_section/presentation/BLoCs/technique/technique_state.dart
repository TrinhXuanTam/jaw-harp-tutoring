part of 'technique_bloc.dart';

@immutable
abstract class TechniqueState {}

class TechniqueLoading extends TechniqueState {}

class TechniqueLoaded extends TechniqueState {
  final Technique technique;

  TechniqueLoaded(this.technique);
}
