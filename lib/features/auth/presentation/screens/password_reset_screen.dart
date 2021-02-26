import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';

class PasswordResetScreen extends StatefulWidget {
  @override
  _PasswordResetScreenState createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final _emailController = TextEditingController();
  final _passwordResetBloc = serviceLocator<PasswordResetBloc>();

  void _passwordResetBlocListener(BuildContext ctx, PasswordResetState state) {
    if (state is PasswordResetSuccess)
      Navigator.pushReplacementNamed(ctx, PASSWORD_RESET_SENT_SCREEN_ROUTE);
    else if (state is PasswordResetFail)
      showDialog(
        context: ctx,
        builder: (_) {
          return OneButtonAlertDialog(
            title: "Password reset failed",
            message: state.message,
          );
        },
      );
  }

  @override
  void dispose() {
    _passwordResetBloc.close();
    super.dispose();
  }

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
      body: BlocProvider<PasswordResetBloc>(
        create: (_) => _passwordResetBloc,
        child: CenteredStack(
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
                  child: Text(
                    localizations.translate("Enter the email associated with your account and we'll send an email with instructions to reset your password."),
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                RoundedTextField(
                  icon: Icons.mail,
                  placeholderText: localizations.translate("Email"),
                  controller: _emailController,
                ),
                SizedBox(height: 10),
                BlocListener<PasswordResetBloc, PasswordResetState>(
                  listener: _passwordResetBlocListener,
                  child: RoundedButton(
                    text: localizations.translate("Send Instructions"),
                    onPressed: () => _passwordResetBloc.add(PasswordResetRequestEvent(_emailController.text)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
