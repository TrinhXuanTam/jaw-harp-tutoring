part of 'user_section_navigation_bloc.dart';

@immutable
abstract class UserSectionNavigationState {
  final Widget body;
  final int bottomNavigatorIndex;
  final bool reversed;
  final Widget Function(Widget, Animation<double>, Animation<double>) transition;

  UserSectionNavigationState({
    required this.body,
    required this.bottomNavigatorIndex,
    required this.transition,
    this.reversed = false,
  });
}

class HomePage extends UserSectionNavigationState {
  HomePage(bool reversed)
      : super(
          body: HomePageBody(),
          bottomNavigatorIndex: HOME_INDEX,
          reversed: reversed,
          transition: defaultHorizontalSharedAxisTransition,
        );
}

class DownloadsPage extends UserSectionNavigationState {
  DownloadsPage(bool reversed)
      : super(
          body: Container(),
          bottomNavigatorIndex: DOWNLOADS_INDEX,
          reversed: reversed,
          transition: defaultHorizontalSharedAxisTransition,
        );
}

class FavoritesPage extends UserSectionNavigationState {
  FavoritesPage(bool reversed)
      : super(
          body: Container(),
          bottomNavigatorIndex: FAVORITES_INDEX,
          reversed: reversed,
          transition: defaultHorizontalSharedAxisTransition,
        );
}

class ProfileSectionPage extends UserSectionNavigationState {
  ProfileSectionPage(bool reversed)
      : super(
          body: AdminMenuScreen(),
          bottomNavigatorIndex: PROFILE_SECTION_INDEX,
          reversed: reversed,
          transition: defaultHorizontalSharedAxisTransition,
        );
}

class CategoriesPage extends UserSectionNavigationState {
  CategoriesPage(List<Category> categories)
      : super(
          body: CategoriesScreenBody(categories: categories),
          bottomNavigatorIndex: HOME_INDEX,
          transition: defaultHorizontalSharedAxisTransition,
        );
}
