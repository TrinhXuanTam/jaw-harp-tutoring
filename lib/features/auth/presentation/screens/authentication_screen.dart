import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/auth/presentation/widgets/authentication_methods.dart';
import 'package:jews_harp/features/auth/presentation/widgets/authentication_screen_background.dart';
import 'package:jews_harp/features/auth/presentation/widgets/sign_up_text.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AuthenticationScreenBackground(),
              AuthMethods(),
            ],
          ),
          Positioned(
            bottom: 20,
            child: SignUpText(),
          ),
        ],
      ),
    );
  }
}
