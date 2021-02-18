import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/auth/presentation/widgets/text_divider.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedTextField(
                  icon: Icons.person,
                  placeholderText: "Email",
                ),
                RoundedPasswordField(
                  placeholderText: "Password",
                ),
                RoundedButton(
                  text: "Sign In",
                  onPressed: () {},
                ),
                TextDivider(text: "OR"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
