import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String route = "/emailVerification";
  final User user;

  const EmailVerificationScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  void _emailVerificationScreenListener(BuildContext ctx, EmailVerificationState state) {
    final AppLocalizations localizations = AppLocalizations.of(ctx);

    if (state is EmailVerificationClosedState)
      Navigator.pop(ctx);
    else if (state is EmailVerifiedState) {
      BlocProvider.of<AuthBloc>(ctx).add(
        UserAuthenticatedEvent(this.user),
      );
      Navigator.pop(ctx);
    } else if (state is EmailNotVerifiedState)
      showDialog(
        context: ctx,
        child: OneButtonAlertDialog(
          title: localizations.translate("Email not verified"),
          message: localizations.translate("Please verify your email before you continue!"),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => serviceLocator<EmailVerificationBloc>(),
      child: BlocConsumer<EmailVerificationBloc, EmailVerificationState>(
        listener: _emailVerificationScreenListener,
        builder: (ctx, state) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => BlocProvider.of<EmailVerificationBloc>(ctx).add(
                  EmailVerificationClosedEvent(user),
                ),
                icon: Icon(
                  Icons.close_rounded,
                  color: BASE_COLOR,
                  size: 35,
                ),
              ),
            ),
            body: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _TitleWithIcon(),
                      _InfoText(email: user.email),
                      SizedBox(height: 10),
                      _Buttons(
                        sendButtonActive: state is EmailVerificationSentState,
                        user: this.user,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TitleWithIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
        Icon(
          Icons.check_circle_outline_sharp,
          size: 150,
          color: Colors.green,
        ),
        Text(
          localizations.translate("Account Created"),
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
      ],
    );
  }
}

class _InfoText extends StatelessWidget {
  final String email;

  const _InfoText({
    Key key,
    @required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      child: Column(
        children: [
          Text(
            localizations.translate("We have sent an email with a confirmation link to your email address. In order to complete the sign-up process, please click the confirmation link."),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          Text(
            localizations.translate("If you do not receive a confirmation email, please check your spam folder. Also, please verify that you entered a valid email address:") + ' "${this.email}."',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}

/// Continue and "send verification email" buttons
class _Buttons extends StatelessWidget {
  final bool sendButtonActive;
  final User user;

  const _Buttons({
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
