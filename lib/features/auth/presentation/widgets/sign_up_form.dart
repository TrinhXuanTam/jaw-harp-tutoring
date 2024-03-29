import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm();

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
    final AppLocalizations l10n = AppLocalizations.of(context);

    return Column(
      children: [
        RoundedTextField(
          icon: Icons.person,
          placeholderText: l10n.translate("Full Name"),
          controller: nameController,
        ),
        const SizedBox(height: 10),
        RoundedTextField(
          icon: Icons.mail,
          placeholderText: l10n.translate("Email"),
          controller: emailController,
        ),
        const SizedBox(height: 10),
        RoundedPasswordField(
          placeholderText: l10n.translate("Password"),
          controller: passwordController,
        ),
        const SizedBox(height: 10),
        RoundedPasswordField(
          placeholderText: l10n.translate("Repeat Password"),
          controller: passwordRepeatController,
        ),
        const SizedBox(height: 10),
        RoundedButton(
          text: l10n.translate("Sign Up"),
          onPressed: () => BlocProvider.of<SignUpBloc>(context).add(
            SignUpButtonPressedEvent(
              nameController.text,
              emailController.text,
              passwordController.text,
              passwordRepeatController.text,
            ),
          ),
        ),
      ],
    );
  }
}
