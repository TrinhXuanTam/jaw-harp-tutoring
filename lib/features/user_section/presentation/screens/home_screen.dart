import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/home_screen/home_screen_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/categories_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final categories = [
      {
        "title": "Beginner techniques",
        "description": "Learn beginner techniques!",
      },
    ];

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
          final authBlocState = BlocProvider.of<AuthBloc>(context).state;

          if (authBlocState is AuthenticatedState && index == 1) {
            BlocProvider.of<AuthBloc>(context).add(UserSignOutEvent());
          }

          if (index == 2) Navigator.pushNamed(context, CATEGORIES_SCREEN_ROUTE, arguments: CategoriesScreenArgs(serviceLocator<HomeScreenBloc>()));

          if (index == 3) Navigator.pushNamed(context, ADMIN_MENU_SCREEN_ROUTE);
        },
      ),
    );
  }
}
