part of 'techniques_bloc.dart';

@immutable
abstract class TechniquesState {}

class TechniquesLoading extends TechniquesState {}

class TechniquesLoaded extends TechniquesState {
  final List<Technique> techniques;

  TechniquesLoaded(this.techniques);

}