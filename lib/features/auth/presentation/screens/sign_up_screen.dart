import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_subtitle.dart';

class SignUpScreen extends StatelessWidget {
  void _signUpBlocListener(BuildContext ctx, SignUpState state) {
    if (state is SignUpSuccessState)
      Navigator.pushReplacementNamed(
        ctx,
        EMAIL_VERIFICATION_UP_SCREEN_ROUTE,
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
                    SignUpForm(),
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