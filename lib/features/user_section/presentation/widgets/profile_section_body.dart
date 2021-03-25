import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/simple_menu.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class ProfileSectionBody extends StatelessWidget {
  String _getFirstCharacters(User user) {
    final words = user.name.split(" ");
    return words.map((e) => e[0]).join();
  }

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
                Container(
                  height: 120,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: getRandomShade(user.name.hashCode),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    width: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        _getFirstCharacters(user),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
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
                  title: "Account settings",
                  items: [
                    SimpleMenuItem("Sign out", () => BlocProvider.of<AuthBloc>(context).add(UserSignOutEvent())),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
