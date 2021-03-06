part of 'admin_menu_bloc.dart';

@immutable
abstract class AdminMenuState {}

class AdminMenuInitialState extends AdminMenuState {}

class VisibleCategoriesLoadedState extends AdminMenuState {
  final List<Category> visibleCategories;

  VisibleCategoriesLoadedState(this.visibleCategories);
}

class HiddenCategoriesLoadedState extends AdminMenuState {
  final List<Category> hiddenCategories;

  HiddenCategoriesLoadedState(this.hiddenCategories);
}
