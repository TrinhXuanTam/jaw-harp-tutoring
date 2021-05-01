part of 'technique_list_bloc.dart';

@immutable
abstract class TechniqueListState {}

/// Initial state.
class TechniqueListLoading extends TechniqueListState {}

/// Techniques have been loaded.
class TechniqueListLoaded extends TechniqueListState {
  final List<Technique> techniques;

  TechniqueListLoaded(this.techniques);
}
