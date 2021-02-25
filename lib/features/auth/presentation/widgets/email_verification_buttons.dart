import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/auth/application/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';

/// Continue and "send verification email" buttons
class EmailVerificationButtons extends StatelessWidget {
  final bool sendButtonActive;
  final User user;

  const EmailVerificationButtons({
    Key key,
    @required this.sendButtonActive,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
        RoundedButton(
          text: localizations.translate("Continue"),
          onPressed: () => BlocProvider.of<EmailVerificationBloc>(context).add(
            EmailVerificationContinueEvent(user),
          ),
        ),
        SizedBox(height: 5),
        RoundedButton(
          text: sendButtonActive ? localizations.translate("Verification Email Sent") : localizations.translate("Resend Verification Email"),
          color: Colors.white,
          borderColor: sendButtonActive ? Colors.grey : BASE_COLOR,
          textColor: sendButtonActive ? Colors.grey : BASE_COLOR,
          onPressed: sendButtonActive ? null : () => BlocProvider.of<EmailVerificationBloc>(context).add(EmailVerificationRequestEvent(this.user)),
        ),
      ],
    );
  }
}
