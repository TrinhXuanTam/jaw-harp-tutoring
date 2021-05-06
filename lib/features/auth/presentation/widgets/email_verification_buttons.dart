import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/one_time_button.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';

/// Verification screen buttons.
class EmailVerificationButtons extends StatelessWidget {
  const EmailVerificationButtons();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Button to check confirmation status.
        RoundedButton(
          text: "Continue",
          onPressed: () => BlocProvider.of<EmailVerificationBloc>(context).add(
            EmailVerificationContinueEvent(),
          ),
        ),
        const SizedBox(height: 5),
        // One time button for resending email.
        OneTimeButton(
          text: "Resend Verification Email",
          inactiveText: "Verification Email Sent",
          color: Colors.transparent,
          textColor: BASE_COLOR,
          borderColor: BASE_COLOR,
          onPressed: () => BlocProvider.of<EmailVerificationBloc>(context).add(EmailVerificationRequestEvent()),
        ),
      ],
    );
  }
}
