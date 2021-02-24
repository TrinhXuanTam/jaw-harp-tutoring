import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: TransparentIconAppBar(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithIcon(
                icon: Icons.settings_backup_restore_rounded,
                title: "Reset Password",
              ),
              Container(
                width: size.width * 0.7,
                child: Column(
                  children: [
                    Text(
                      localizations.translate("Enter the email associated with your account and we'll send an email with instructions to reset your password."),
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              RoundedTextField(
                icon: Icons.mail,
                placeholderText: localizations.translate("Email"),
                controller: emailController,
              ),
              SizedBox(height: 10),
              RoundedButton(
                text: localizations.translate("Send Instructions"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, PASSWORD_RESET_SENT_SCREEN_ROUTE);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
