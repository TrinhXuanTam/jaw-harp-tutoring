import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/categories/categories_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/user_section_navigation/user_section_navigation_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/categories_screen_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/home_page_body.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/profile_section_body.dart';

// Bottom navigation indexes
const int HOME_INDEX = 0;
const int MY_TECHNIQUES_INDEX = 1;
const int CATEGORIES_INDEX = 2;
const int PROFILE_SECTION_INDEX = 3;

class UserSection extends StatelessWidget {
  PreferredSizeWidget? _buildAppBar(BuildContext ctx) {
    final bloc = BlocProvider.of<UserSectionNavigationBloc>(ctx);

    if (bloc.state.bottomNavigatorIndex == CATEGORIES_INDEX)
      return IconAppBar(
        backgroundColor: BASE_COLOR,
        title: "Categories",
        titleColor: Colors.white,
      );
    else
      return AppBar(backgroundColor: Colors.transparent, elevation: 0);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CategoriesBloc>(create: (_) => serviceLocator<CategoriesBloc>()..add(LoadCategories())),
        BlocProvider<UserSectionNavigationBloc>(create: (_) => serviceLocator<UserSectionNavigationBloc>()),
      ],
      child: BlocBuilder<UserSectionNavigationBloc, UserSectionNavigationState>(
        builder: (ctx, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: _buildAppBar(ctx),
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: state.bottomNavigatorIndex,
            backgroundColor: BASE_COLOR,
            items: [
              BottomNavyBarItem(icon: Icon(Icons.home_outlined), title: Text("Home"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.play_circle_outline_rounded), title: Text("My Techniques", style: TextStyle(fontSize: 12)), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.apps_rounded), title: Text("Categories"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.person_outline_rounded), title: Text("Account"), activeColor: Colors.white, textAlign: TextAlign.center),
            ],
            onItemSelected: (int value) {
              final bloc = BlocProvider.of<UserSectionNavigationBloc>(ctx);

              if (value == HOME_INDEX)
                bloc.add(UserSectionNavigationEvent(body: HomePageBody(), bottomNavigatorIndex: HOME_INDEX));
              else if (value == MY_TECHNIQUES_INDEX)
                bloc.add(UserSectionNavigationEvent(body: Container(), bottomNavigatorIndex: MY_TECHNIQUES_INDEX));
              else if (value == CATEGORIES_INDEX)
                bloc.add(UserSectionNavigationEvent(body: CategoriesScreenBody(), bottomNavigatorIndex: CATEGORIES_INDEX));
              else if (value == PROFILE_SECTION_INDEX) bloc.add(UserSectionNavigationEvent(body: ProfileSectionBody(), bottomNavigatorIndex: PROFILE_SECTION_INDEX));
            },
          ),
          body: PageTransitionSwitcher(
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
    );
  }
}
