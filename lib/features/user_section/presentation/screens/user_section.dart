import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/connectivity/connectivity_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/most_recent_techniques/most_recent_techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/categories_screen_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/home_page_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/my_techniques_screen_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/profile_section_body.dart';
import 'package:jews_harp/features/user_section/utils.dart';

// Bottom navigation indexes
const int HOME_INDEX = 0;
const int MY_TECHNIQUES_INDEX = 1;
const int CATEGORIES_INDEX = 2;
const int PROFILE_SECTION_INDEX = 3;

/// User section screen controller.
class UserSection extends StatelessWidget {
  /// Build the top app bar.
  PreferredSizeWidget? _buildAppBar(BuildContext ctx) {
    final l10n = AppLocalizations.of(ctx);
    final bloc = BlocProvider.of<UserSectionNavigationBloc>(ctx);
    final index = bloc.state.bottomNavigatorIndex;
    bool showAvatar = true;
    String title = "";

    if (index == HOME_INDEX)
      title = "Explore";
    else if (index == MY_TECHNIQUES_INDEX)
      title = "My techniques";
    else if (index == CATEGORIES_INDEX)
      title = "Select a category";
    else if (index == PROFILE_SECTION_INDEX) showAvatar = false;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        l10n.translate(title),
        style: const TextStyle(
          color: Colors.black,
          fontSize: 25,
        ),
      ),
      actions: [
        if (showAvatar)
          GestureDetector(
            onTap: () => bloc.add(UserSectionNavigationEvent(body: ProfileSectionBody(), bottomNavigatorIndex: PROFILE_SECTION_INDEX)),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
                builder: (context, state) {
                  if (state is NoInternetConnection) return generateProfilePhoto(ctx, size: 27);
                  return buildProfilePhoto(ctx, size: 27);
                },
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<MostRecentTechniquesBloc>(create: (_) => serviceLocator<MostRecentTechniquesBloc>()..add(LoadMostRecentTechniques())),
        BlocProvider<CategoriesBloc>(create: (_) => serviceLocator<CategoriesBloc>()..add(LoadCategories())),
        BlocProvider<UserSectionNavigationBloc>(create: (_) => serviceLocator<UserSectionNavigationBloc>()),
      ],
      child: BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (ctx, state) {
          if (state is ConnectionAvailable) BlocProvider.of<AuthBloc>(ctx).add(ReloadUserData());
        },
        child: BlocBuilder<UserSectionNavigationBloc, UserSectionNavigationState>(
          builder: (ctx, state) => Scaffold(
            backgroundColor: Colors.white,
            appBar: _buildAppBar(ctx),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: state.bottomNavigatorIndex,
              backgroundColor: BASE_COLOR,
              items: [
                BottomNavyBarItem(
                  icon: Icon(Icons.home_outlined),
                  title: Text(l10n.translate("Home")),
                  activeColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.play_circle_outline_rounded),
                  title: Text(
                    l10n.translate("My Techniques"),
                    softWrap: false,
                    style: const TextStyle(fontSize: 11),
                  ),
                  activeColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.apps_rounded),
                  title: Text(l10n.translate("Categories")),
                  activeColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
                BottomNavyBarItem(
                  icon: Icon(Icons.person_outline_rounded),
                  title: Text(l10n.translate("Account")),
                  activeColor: Colors.white,
                  textAlign: TextAlign.center,
                ),
              ],
              onItemSelected: (int value) {
                final bloc = BlocProvider.of<UserSectionNavigationBloc>(ctx);
                if (value == HOME_INDEX) {
                  bloc.add(UserSectionNavigationEvent(body: const HomePageBody(), bottomNavigatorIndex: HOME_INDEX));
                } else if (value == MY_TECHNIQUES_INDEX) {
                  bloc.add(UserSectionNavigationEvent(body: const MyTechniquesScreenBody(), bottomNavigatorIndex: MY_TECHNIQUES_INDEX));
                } else if (value == CATEGORIES_INDEX) {
                  bloc.add(UserSectionNavigationEvent(body: const CategoriesScreenBody(), bottomNavigatorIndex: CATEGORIES_INDEX));
                } else if (value == PROFILE_SECTION_INDEX) {
                  bloc.add(UserSectionNavigationEvent(body: const ProfileSectionBody(), bottomNavigatorIndex: PROFILE_SECTION_INDEX));
                }
              },
            ),
            body: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: PageTransitionSwitcher(
                reverse: state.reversedTransition,
                transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
                  child: child,
                  animation: primaryAnimation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: SharedAxisTransitionType.horizontal,
                ),
                child: state.body,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
