import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_form/email_form_bloc.dart';

/// Email authentication form
class EmailAuthenticationForm extends StatelessWidget {
  const EmailAuthenticationForm();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return BlocProvider<EmailFormBloc>(
      create: (_) => serviceLocator<EmailFormBloc>(),
      child: Builder(
        builder: (ctx) {
          final bloc = BlocProvider.of<EmailFormBloc>(ctx);
          return Column(
            children: [
              RoundedTextField(
                icon: Icons.mail,
                placeholderText: l10n.translate("Email"),
                controller: bloc.state.emailController,
              ),
              const SizedBox(height: 10),
              RoundedPasswordField(
                placeholderText: l10n.translate("Password"),
                controller: bloc.state.passwordController,
              ),
              const SizedBox(height: 10),
              RoundedButton(
                text: l10n.translate("Sign In"),
                onPressed: () {
                  bloc.add(EmailAuthenticationRequestEvent());
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
