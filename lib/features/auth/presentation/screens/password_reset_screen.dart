import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/password_reset/password_reset_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';

class PasswordResetScreen extends StatelessWidget {
  void _passwordResetBlocListener(BuildContext ctx, PasswordResetState state) {
    if (state is PasswordResetSuccess) Navigator.pushReplacementNamed(ctx, PASSWORD_RESET_SENT_SCREEN_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: BlocProvider<PasswordResetBloc>(
        create: (_) => serviceLocator<PasswordResetBloc>(),
        child: Builder(
          builder: (ctx) {
            final bloc = BlocProvider.of<PasswordResetBloc>(ctx);
            return CenteredStack(
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
                        l10n.translate("Enter the email associated with your account and we'll send an email with instructions to reset your password."),
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    RoundedTextField(
                      icon: Icons.mail,
                      placeholderText: l10n.translate("Email"),
                      controller: bloc.state.emailController,
                    ),
                    SizedBox(height: 10),
                    BlocListener<PasswordResetBloc, PasswordResetState>(
                      listener: _passwordResetBlocListener,
                      child: RoundedButton(
                        text: l10n.translate("Send Instructions"),
                        onPressed: () => bloc.add(PasswordResetRequestEvent()),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
