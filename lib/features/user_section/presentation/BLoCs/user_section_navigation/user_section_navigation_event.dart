part of 'user_section_navigation_bloc.dart';

@immutable
abstract class UserSectionNavigationEvent {
  final bool reversedTransition;
  final Widget Function(Widget, Animation<double>, Animation<double>) transition;

  UserSectionNavigationEvent({this.reversedTransition = false, required this.transition});
}

class NavigateToHomePage extends UserSectionNavigationEvent {
  NavigateToHomePage({
    bool reversedTransition = false,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(reversedTransition: reversedTransition, transition: transition);
}

class NavigateToDownloads extends UserSectionNavigationEvent {
  NavigateToDownloads({
    bool reversedTransition = false,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(reversedTransition: reversedTransition, transition: transition);
}

class NavigateToFavorites extends UserSectionNavigationEvent {
  NavigateToFavorites({
    bool reversedTransition = false,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(reversedTransition: reversedTransition, transition: transition);
}

class NavigateToProfileSection extends UserSectionNavigationEvent {
  NavigateToProfileSection({
    bool reversedTransition = false,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(reversedTransition: reversedTransition, transition: transition);
}

class NavigateToCategoriesPage extends UserSectionNavigationEvent {
  final List<Category> categories;

  NavigateToCategoriesPage({
    required this.categories,
    bool reversedTransition = false,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(reversedTransition: reversedTransition, transition: transition);
}

class NavigateToCategoryDetailPage extends UserSectionNavigationEvent {
  final Category category;

  NavigateToCategoryDetailPage({
    required this.category,
    bool reversedTransition = false,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(reversedTransition: reversedTransition, transition: transition);
}
