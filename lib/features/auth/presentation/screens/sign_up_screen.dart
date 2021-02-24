import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
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
    return BlocProvider(
      create: (_) => serviceLocator<SignUpBloc>(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: _signUpBlocListener,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: TransparentIconAppBar(
            icon: Icons.arrow_back_rounded,
            onPressed: () => Navigator.pop(context),
          ),
          body: CenteredStack(
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
    );
  }
}
