import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/auth/presentation/widgets/authentication_methods.dart';
import 'package:jews_harp/features/auth/presentation/widgets/sign_up_text.dart';

/// Authentication Screen.
class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: const CenteredStack(
        children: [
          // Authentication methods.
          const AuthMethods(),
          // Sign up text.
          const Positioned(
            bottom: 20,
            child: const SignUpText(),
          ),
        ],
      ),
    );
  }
}
