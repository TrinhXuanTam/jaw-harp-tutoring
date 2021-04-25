import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/simple_menu.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class ProfileSectionBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = getUser(context);

    return CenteredStack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildProfilePhoto(context, size: 120),
                SizedBox(height: 20),
                Text(
                  user.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email_outlined,
                      color: BASE_COLOR,
                      size: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      user.email,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                SimpleMenu(
                  title: "Admin",
                  items: [
                    SimpleMenuItem("Create Technique", () => Navigator.pushNamed(context, CREATE_TECHNIQUE_SCREEN_ROUTE)),
                    SimpleMenuItem("Create Category", () => Navigator.pushNamed(context, CREATE_CATEGORY_SCREEN_ROUTE)),
                    SimpleMenuItem("View Techniques", () => Navigator.pushNamed(context, TECHNIQUE_LIST_SCREEN_ROUTE)),
                    SimpleMenuItem("Visible Categories", () => Navigator.pushNamed(context, VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE)),
                    SimpleMenuItem("Hidden Categories", () => Navigator.pushNamed(context, HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE)),
                  ],
                ),
                SizedBox(height: 20),
                SimpleMenu(
                  title: "Account settings",
                  items: [
                    SimpleMenuItem("Sign out", () => BlocProvider.of<AuthBloc>(context).add(UserSignOutEvent())),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
