import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/auth/application/BLoCs/authentication_screen/auth_screen_bloc.dart';

/// Email authentication form
class EmailAuthenticationForm extends StatefulWidget {
  @override
  _EmailAuthenticationFormState createState() => _EmailAuthenticationFormState();
}

class _EmailAuthenticationFormState extends State<EmailAuthenticationForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
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
        RoundedButton(
          text: localizations.translate("Sign In"),
          onPressed: () {
            BlocProvider.of<AuthScreenBloc>(context).add(
              EmailAuthenticationEvent(
                emailController.text,
                passwordController.text,
              ),
            );
          },
        ),
      ],
    );
  }
}
