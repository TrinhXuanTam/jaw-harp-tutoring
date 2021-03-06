import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/email_verification_buttons.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';
import 'package:jews_harp/features/auth/presentation/widgets/verification_text.dart';

class EmailVerificationScreenArgs {
  final User user;

  const EmailVerificationScreenArgs({required this.user});
}

class EmailVerificationScreen extends StatelessWidget {
  final User user;

  factory EmailVerificationScreen.fromArgs(EmailVerificationScreenArgs args) {
    return EmailVerificationScreen(user: args.user);
  }

  const EmailVerificationScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  void _emailVerificationScreenListener(BuildContext ctx, EmailVerificationState state) {
    final AppLocalizations l10n = AppLocalizations.of(ctx);

    if (state is EmailVerificationClosedState)
      BlocProvider.of<AuthBloc>(ctx).add(UserSignOutEvent());
    else if (state is EmailVerifiedState)
      BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(this.user));
    else if (state is EmailNotVerifiedState)
      showDialog(
        context: ctx,
        builder: (_) => OneButtonAlertDialog(
          title: l10n.translate("Email not verified"),
          message: l10n.translate("Please verify your email before you continue!"),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EmailVerificationBloc>(
      create: (_) => serviceLocator<EmailVerificationBloc>(),
      child: BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
        listener: _emailVerificationScreenListener,
        builder: (ctx, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: IconAppBar(
              icon: Icons.close_rounded,
              onPressed: () => BlocProvider.of<EmailVerificationBloc>(ctx).add(
                EmailVerificationClosedEvent(),
              ),
            ),
            body: CenteredStack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleWithIcon(
                      icon: Icons.check_circle_outline_sharp,
                      iconColor: Colors.green,
                      title: "Account Created",
                    ),
                    VerificationText(email: user.email),
                    SizedBox(height: 10),
                    EmailVerificationButtons(
                      sendButtonActive: state is EmailVerificationSentState,
                      user: this.user,
                    ),
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
