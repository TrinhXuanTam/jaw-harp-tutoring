import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_side_scroll.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

          if (index == 3) Navigator.pushNamed(context, ADMIN_MENU_SCREEN_ROUTE);
        },
      ),
      body: CenteredStack(
        children: [
          Container(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    right: 40,
                    top: 40,
                    left: 20,
                    bottom: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, " + getUser(context).name + "!",
                        style: TextStyle(fontWeight: FontWeight.bold, color: BASE_COLOR, fontSize: 17),
                      ),
                      Text(
                        "Are you ready to learn new techniques?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                        ),
                      ),
                      SizedBox(height: 20),
                      CategorySideScroll(),
                      SizedBox(height: 5),
                      TechniqueList(techniques: []),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
