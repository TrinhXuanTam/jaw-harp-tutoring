part of 'user_section_navigation_bloc.dart';

@immutable
abstract class UserSectionNavigationEvent {}

class NavigateToHomePage extends UserSectionNavigationEvent {}

class NavigateToDownloads extends UserSectionNavigationEvent {}

class NavigateToFavorites extends UserSectionNavigationEvent {}

class NavigateToProfileSection extends UserSectionNavigationEvent {}

class NavigateCategoriesPage extends UserSectionNavigationEvent {
  final List<Category> categories;

  NavigateCategoriesPage(this.categories);
}
