import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_verification/email_verification_bloc.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String route = "/emailVerification";
  final User user;

  const EmailVerificationScreen({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => serviceLocator<EmailVerificationBloc>(),
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Container(
                    width: size.width * 0.7,
                    child: Column(
                      children: [
                        Text(
                          localizations.translate(
                              "We have sent an email with a confirmation link to your email address. In order to complete the sign-up process, please click the confirmation link."),
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(height: 10),
                        Text(
                          localizations.translate(
                              "If you do not receive a confirmation email, please check your spam folder. Also, please verify that you entered a valid email address in our sign-up form."),
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  RoundedButton(
                    text: localizations.translate("Continue"),
                    onPressed: () {
                      // TODO
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(height: 5),
                  BlocBuilder<EmailVerificationBloc, EmailVerificationState>(
                    builder: (ctx, state) => RoundedButton(
                      text: state is EmailVerificationSentState
                          ? localizations.translate("Verification Email Sent")
                          : localizations
                              .translate("Resend Verification Email"),
                      color: Colors.white,
                      borderColor: state is EmailVerificationSentState
                          ? Colors.grey
                          : BASE_COLOR,
                      textColor: state is EmailVerificationSentState
                          ? Colors.grey
                          : BASE_COLOR,
                      onPressed: state is EmailVerificationSentState
                          ? null
                          : () => BlocProvider.of<EmailVerificationBloc>(ctx)
                              .add(EmailVerificationRequestEvent(this.user)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
