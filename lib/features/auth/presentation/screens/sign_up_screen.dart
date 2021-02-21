import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/email_verification_screen.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_subtitle.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = "/signUp";

  void _signUpBlocListener(BuildContext ctx, SignUpState state) {
    if (state is SignUpSuccessState)
      Navigator.pushReplacementNamed(
        ctx,
        EmailVerificationScreen.route,
        arguments: state.user,
      );
    else if (state is SignUpFailedState)
      showDialog(
        context: ctx,
        builder: (_) {
          return OneButtonAlertDialog(
            title: "Failed to sign up",
            message: state.message,
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (_) => serviceLocator<SignUpBloc>(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: _signUpBlocListener,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back_rounded,
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
                    TitleWithSubtitle(
                      titleText: "Sign Up",
                      subtitleText: "create a new account",
                    ),
                    SizedBox(height: 20),
                    _SignUpForm(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<_SignUpForm> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      children: [
        RoundedTextField(
          icon: Icons.person,
          placeholderText: localizations.translate("Full Name"),
          controller: nameController,
        ),
        SizedBox(height: 10),
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
        RoundedPasswordField(
          placeholderText: localizations.translate("Repeat Password"),
          controller: passwordRepeatController,
        ),
        SizedBox(height: 10),
        RoundedButton(
          text: localizations.translate("Sign Up"),
          onPressed: () => BlocProvider.of<SignUpBloc>(context).add(
            SignUpButtonPressedEvent(
              nameController.text,
              emailController.text,
              passwordController.text,
              passwordRepeatController.text,
            ),
          ),
        ),
      ],
    );
  }
}
