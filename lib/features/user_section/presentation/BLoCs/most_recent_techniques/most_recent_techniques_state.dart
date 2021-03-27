part of 'most_recent_techniques_bloc.dart';

@immutable
abstract class MostRecentTechniquesState {}

class MostRecentTechniquesLoading extends MostRecentTechniquesState {}

class MostRecentTechniquesLoaded extends MostRecentTechniquesState {
  final List<Technique> techniques;

  MostRecentTechniquesLoaded(this.techniques);
}
