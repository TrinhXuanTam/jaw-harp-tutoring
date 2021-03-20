import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/bottom_navigator/bottom_navigator_bloc.dart';

class UserSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigatorBloc>(
      create: (_) => serviceLocator<BottomNavigatorBloc>(),
      child: BlocBuilder<BottomNavigatorBloc, BottomNavigatorState>(
        builder: (ctx, state) => Scaffold(
          bottomNavigationBar: BottomNavyBar(
            selectedIndex: state.index,
            backgroundColor: BASE_COLOR,
            items: [
              BottomNavyBarItem(icon: Icon(Icons.home_outlined), title: Text("Home"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.download_outlined), title: Text("Downloads"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.favorite_border_rounded), title: Text("Favorites"), activeColor: Colors.white, textAlign: TextAlign.center),
              BottomNavyBarItem(icon: Icon(Icons.person_outline_rounded), title: Text("Profile"), activeColor: Colors.white, textAlign: TextAlign.center),
            ],
            onItemSelected: (int value) {
              BlocProvider.of<BottomNavigatorBloc>(ctx).add(NavigationItemClicked(value));
            },
          ),
          body: PageTransitionSwitcher(
            reverse: state.prevIndex > state.index,
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) => SharedAxisTransition(
              child: child,
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.horizontal,
            ),
            child: state.child,
          ),
        ),
      ),
    );
  }
}
