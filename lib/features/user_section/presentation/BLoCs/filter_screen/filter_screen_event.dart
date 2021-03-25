part of 'filter_screen_bloc.dart';

@immutable
abstract class FilterScreenEvent {}

class LoadFilter extends FilterScreenEvent {
  final String searchKeywords;
  final TechniqueOrder? techniqueOrder;

  LoadFilter(this.searchKeywords, this.techniqueOrder);
}

class ResetFilter extends FilterScreenEvent {}
