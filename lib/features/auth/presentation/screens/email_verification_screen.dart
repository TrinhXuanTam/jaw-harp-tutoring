import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/email_verification_buttons.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';
import 'package:jews_harp/features/auth/presentation/widgets/verification_text.dart';

class EmailVerificationScreen extends StatelessWidget {
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
                      TitleWithIcon(),
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
            ),
          );
        },
      ),
    );
  }
}
