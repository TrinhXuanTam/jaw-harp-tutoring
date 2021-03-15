part of 'hidden_categories_bloc.dart';

@immutable
abstract class HiddenCategoriesState {}

class HiddenCategoriesLoading extends HiddenCategoriesState {}

class HiddenCategoriesLoaded extends HiddenCategoriesState {
  final List<Category> categories;

  HiddenCategoriesLoaded(this.categories);
}
