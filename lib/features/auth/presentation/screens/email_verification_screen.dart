import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/email_verification_buttons.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';
import 'package:jews_harp/features/auth/presentation/widgets/verification_text.dart';

/// Email verification screen.
class EmailVerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationBloc>(
      create: (_) => serviceLocator<EmailVerificationBloc>(),
      child: BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
        builder: (ctx, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: IconAppBar(
              icon: Icons.close_rounded,
              onPressed: () => BlocProvider.of<EmailVerificationBloc>(ctx).add(EmailVerificationClosedEvent()),
            ),
            body: CenteredStack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleWithIcon(
                      icon: Icons.check_circle_outline_sharp,
                      iconColor: Colors.green,
                      title: "Account Created",
                    ),
                    // Informative verification text.
                    const VerificationText(),
                    const SizedBox(height: 10),
                    const EmailVerificationButtons(),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
