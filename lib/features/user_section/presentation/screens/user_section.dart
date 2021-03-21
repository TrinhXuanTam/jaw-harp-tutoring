import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/utils.dart';

// Bottom navigation indexes
const int HOME_INDEX = 0;
const int DOWNLOADS_INDEX = 1;
const int FAVORITES_INDEX = 2;
const int PROFILE_SECTION_INDEX = 3;

class UserSection extends StatelessWidget {
  PreferredSizeWidget? _buildAppBar(BuildContext ctx) {
    final bloc = BlocProvider.of<UserSectionNavigationBloc>(ctx);

    if (bloc.state is CategoriesPage)
      return IconAppBar(
        onPressed: () => bloc.add(
          NavigateToHomePage(reversedTransition: true, transition: defaultFadeThroughTransition),
        ),
      );
    else
      return AppBar(backgroundColor: Colors.transparent, elevation: 0);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserSectionNavigationBloc>(
      create: (_) => serviceLocator<UserSectionNavigationBloc>(),
      child: BlocBuilder<UserSectionNavigationBloc, UserSectionNavigationState>(
        builder: (ctx, state) => Scaffold(
          appBar: _buildAppBar(ctx),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: state.bottomNavigatorIndex,
            backgroundColor: BASE_COLOR,
            items: [
              BottomNavyBarItem(icon: Icon(Icons.home_outlined), title: Text("Home"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.download_outlined), title: Text("Downloads"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.favorite_border_rounded), title: Text("Favorites"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.person_outline_rounded), title: Text("Profile"), activeColor: Colors.white, textAlign: TextAlign.center),
            ],
            onItemSelected: (int value) {
              final bloc = BlocProvider.of<UserSectionNavigationBloc>(ctx);

              if (value == HOME_INDEX)
                bloc.add(NavigateToHomePage(
                  reversedTransition: state.bottomNavigatorIndex > HOME_INDEX,
                  transition: defaultHorizontalSharedAxisTransition,
                ));
              else if (value == DOWNLOADS_INDEX)
                bloc.add(NavigateToDownloads(
                  reversedTransition: state.bottomNavigatorIndex > DOWNLOADS_INDEX,
                  transition: defaultHorizontalSharedAxisTransition,
                ));
              else if (value == FAVORITES_INDEX)
                bloc.add(NavigateToFavorites(
                  reversedTransition: state.bottomNavigatorIndex > FAVORITES_INDEX,
                  transition: defaultHorizontalSharedAxisTransition,
                ));
              else if (value == PROFILE_SECTION_INDEX)
                bloc.add(NavigateToProfileSection(
                  reversedTransition: state.bottomNavigatorIndex > PROFILE_SECTION_INDEX,
                  transition: defaultHorizontalSharedAxisTransition,
                ));
            },
          ),
          body: PageTransitionSwitcher(
            reverse: state.reversedTransition,
            transitionBuilder: state.transition,
            child: state.body,
          ),
        ),
      ),
    );
  }
}
