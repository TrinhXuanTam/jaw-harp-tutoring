import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';

class TechniqueListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: BASE_COLOR,
        items: [
          TabItem(icon: Icons.favorite_border_rounded, activeIcon: Icons.favorite_rounded),
          TabItem(icon: Icons.search_outlined, activeIcon: Icons.search),
          TabItem(icon: Icons.home_outlined, activeIcon: Icons.home),
          TabItem(icon: Icons.download_outlined, activeIcon: Icons.file_download),
          TabItem(icon: Icons.person_outline_rounded, activeIcon: Icons.person_rounded),
        ],
        initialActiveIndex: 2,
        onTap: (_) {
          final authBlocState = BlocProvider.of<AuthBloc>(context).state;

          if (authBlocState is AuthenticatedState) {
            BlocProvider.of<AuthBloc>(context).add(UserSignOutEvent());
          }
        },
      ),
    );
  }
}
