import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: BASE_COLOR,
        items: [
          TabItem(icon: Icons.home_outlined, activeIcon: Icons.home),
          TabItem(icon: Icons.download_outlined, activeIcon: Icons.file_download),
          TabItem(icon: Icons.favorite_border_rounded, activeIcon: Icons.favorite_rounded),
          TabItem(icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded),
        ],
        initialActiveIndex: 0,
        onTap: (index) {
          // final authBlocState = BlocProvider.of<AuthBloc>(context).state;
          //
          // if (authBlocState is AuthenticatedState) {
          //   BlocProvider.of<AuthBloc>(context).add(UserSignOutEvent());
          // }

          if (index == 3) Navigator.pushNamed(context, ADMIN_MENU_SCREEN_ROUTE);
        },
      ),
    );
  }
}
