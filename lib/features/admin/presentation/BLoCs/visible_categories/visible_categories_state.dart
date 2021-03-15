part of 'visible_categories_bloc.dart';

@immutable
abstract class VisibleCategoriesState {}

class VisibleCategoriesLoading extends VisibleCategoriesState {}

class VisibleCategoriesLoaded extends VisibleCategoriesState {
  final List<Category> categories;

  VisibleCategoriesLoaded(this.categories);
}
