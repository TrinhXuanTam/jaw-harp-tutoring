import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';

/// Email authentication form
class EmailAuthenticationForm extends StatefulWidget {
  @override
  _EmailAuthenticationFormState createState() => _EmailAuthenticationFormState();
}

class _EmailAuthenticationFormState extends State<EmailAuthenticationForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailAuthBloc = serviceLocator<EmailAuthBloc>();

  void _mailAuthBlocListener(BuildContext ctx, EmailAuthState state) {
    if (state is EmailAuthSuccessState) BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(state.user));
  }

  @override
  void dispose() {
    _emailAuthBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return BlocProvider<EmailAuthBloc>(
      create: (_) => _emailAuthBloc,
      child: Column(
        children: [
          RoundedTextField(
            icon: Icons.mail,
            placeholderText: l10n.translate("Email"),
            controller: _emailController,
          ),
          SizedBox(height: 10),
          RoundedPasswordField(
            placeholderText: l10n.translate("Password"),
            controller: _passwordController,
          ),
          SizedBox(height: 10),
          BlocListener<EmailAuthBloc, EmailAuthState>(
            listener: _mailAuthBlocListener,
            child: RoundedButton(
              text: l10n.translate("Sign In"),
              onPressed: () {
                _emailAuthBloc.add(
                  EmailAuthenticationRequestEvent(
                    _emailController.text,
                    _passwordController.text,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
