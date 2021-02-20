import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
        RoundedTextField(
          icon: Icons.person,
          placeholderText: localizations.translate("Full Name"),
          controller: nameController,
        ),
        SizedBox(height: 10),
        RoundedTextField(
          icon: Icons.mail,
          placeholderText: localizations.translate("Email"),
          controller: emailController,
        ),
        SizedBox(height: 10),
        RoundedPasswordField(
          placeholderText: localizations.translate("Password"),
          controller: passwordController,
        ),
        SizedBox(height: 10),
        RoundedPasswordField(
          placeholderText: localizations.translate("Repeat Password"),
          controller: passwordRepeatController,
        ),
        SizedBox(height: 10),
        RoundedButton(
          text: localizations.translate("Sign Up"),
          onPressed: () {},
        ),
      ],
    );
  }
}
