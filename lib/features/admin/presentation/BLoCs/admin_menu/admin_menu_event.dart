part of 'admin_menu_bloc.dart';

@immutable
abstract class AdminMenuEvent {}

class LoadVisibleCategoriesEvent extends AdminMenuEvent {}

class LoadHiddenCategoriesEvent extends AdminMenuEvent {}
