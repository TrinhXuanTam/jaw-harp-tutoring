part of 'technique_list_bloc.dart';

@immutable
abstract class TechniqueListState {}

class TechniqueListLoading extends TechniqueListState {}

class TechniqueListLoaded extends TechniqueListState {
  final List<Technique> techniques;

  TechniqueListLoaded(this.techniques);
}
