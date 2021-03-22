part of 'user_section_navigation_bloc.dart';

@immutable
abstract class UserSectionNavigationState {
  final Widget body;
  final int bottomNavigatorIndex;
  final bool reversedTransition;
  final Widget Function(Widget, Animation<double>, Animation<double>) transition;

  UserSectionNavigationState({
    required this.body,
    required this.bottomNavigatorIndex,
    required this.transition,
    this.reversedTransition = false,
  });
}

class HomePage extends UserSectionNavigationState {
  HomePage({
    required bool reversedTransition,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(
          body: HomePageBody(),
          bottomNavigatorIndex: HOME_INDEX,
          reversedTransition: reversedTransition,
          transition: transition,
        );
}

class DownloadsPage extends UserSectionNavigationState {
  DownloadsPage({
    required bool reversedTransition,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(
          body: Container(),
          bottomNavigatorIndex: DOWNLOADS_INDEX,
          reversedTransition: reversedTransition,
          transition: transition,
        );
}

class FavoritesPage extends UserSectionNavigationState {
  FavoritesPage({
    required bool reversedTransition,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(
          body: Container(),
          bottomNavigatorIndex: FAVORITES_INDEX,
          reversedTransition: reversedTransition,
          transition: transition,
        );
}

class ProfileSectionPage extends UserSectionNavigationState {
  ProfileSectionPage({
    required bool reversedTransition,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(
          body: AdminMenuScreen(),
          bottomNavigatorIndex: PROFILE_SECTION_INDEX,
          reversedTransition: reversedTransition,
          transition: transition,
        );
}

class CategoriesPage extends UserSectionNavigationState {
  CategoriesPage({
    required List<Category> categories,
    required bool reversedTransition,
    required Widget Function(Widget, Animation<double>, Animation<double>) transition,
  }) : super(
          body: CategoriesScreenBody(categories: categories),
          bottomNavigatorIndex: HOME_INDEX,
          reversedTransition: reversedTransition,
          transition: transition,
        );
}