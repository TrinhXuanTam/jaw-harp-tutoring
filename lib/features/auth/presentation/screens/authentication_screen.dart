import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/authentication_screen/auth_screen_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:jews_harp/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_authentication.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_subtitle.dart';

class AuthenticationScreen extends StatelessWidget {
  static const String route = "/authentication";

  void _authScreenBlocListener(BuildContext ctx, AuthScreenState state) {
    if (state is AuthSuccessState)
      BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent());
    else if (state is AuthFailedState) {
      showDialog(
        context: ctx,
        builder: (_) {
          return OneButtonAlertDialog(
            title: "Failed to sign in",
            message: state.message,
          );
        },
      );
    } else if (state is AuthNotVerifiedState)
      Navigator.pushNamed(
        ctx,
        EmailVerificationScreen.route,
        arguments: state.user,
      );
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (_) => serviceLocator<AuthScreenBloc>(),
        child: BlocListener<AuthScreenBloc, AuthScreenState>(
          listener: _authScreenBlocListener,
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                _Background(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TitleWithSubtitle(
                      titleText: "Welcome!",
                      subtitleText: "please sign in to continue",
                    ),
                    SizedBox(height: 20),
                    _EmailAuthenticationForm(),
                    SizedBox(height: 5),
                    _ForgotPasswordText(),
                    TextDivider(text: localizations.translate("OR")),
                    ThirdPartyAuthOptions(),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  child: _SignUpText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _EmailAuthenticationForm extends StatefulWidget {
  @override
  _EmailAuthenticationFormState createState() =>
      _EmailAuthenticationFormState();
}

class _EmailAuthenticationFormState extends State<_EmailAuthenticationForm> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
        RoundedTextField(
          icon: Icons.mail,
          placeholderText: localizations.translate("Email"),
          controller: emailController,
        ),
        SizedBox(height: 10),
        RoundedPasswordField(
          placeholderText: localizations.translate("Password"),
          controller: passwordController,
        ),
        SizedBox(height: 10),
        RoundedButton(
          text: localizations.translate("Sign In"),
          onPressed: () {
            BlocProvider.of<AuthScreenBloc>(context).add(
              EmailAuthenticationEvent(
                emailController.text,
                passwordController.text,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(
          localizations.translate("Forgot Password?"),
          style: TextStyle(
            color: BASE_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return InkWell(
      onTap: () => Navigator.pushNamed(context, SignUpScreen.route),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: RichText(
          text: TextSpan(
            text: localizations.translate("Don't have an Account?"),
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            children: [
              WidgetSpan(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    localizations.translate("Sign Up"),
                    style: TextStyle(
                      fontSize: 18,
                      color: BASE_COLOR,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
