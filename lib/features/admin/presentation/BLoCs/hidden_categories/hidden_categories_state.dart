part of 'hidden_categories_bloc.dart';

@immutable
abstract class HiddenCategoriesState {}

/// Initial state.
class HiddenCategoriesLoading extends HiddenCategoriesState {}

/// Categories marked as hidden have been loaded.
class HiddenCategoriesLoaded extends HiddenCategoriesState {
  final List<Category> categories;

  HiddenCategoriesLoaded(this.categories);
}
