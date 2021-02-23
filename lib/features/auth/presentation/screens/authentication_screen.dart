import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/authentication_screen/auth_screen_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/authentication_methods.dart';
import 'package:jews_harp/features/auth/presentation/widgets/authentication_screen_background.dart';
import 'package:jews_harp/features/auth/presentation/widgets/sign_up_text.dart';

class AuthenticationScreen extends StatelessWidget {
  void _authScreenBlocListener(BuildContext ctx, AuthScreenState state) {
    if (state is AuthSuccessState)
      BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(state.user));
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
        EMAIL_VERIFICATION_UP_SCREEN_ROUTE,
        arguments: state.user,
      );
  }

  @override
  Widget build(BuildContext context) {
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
                AuthenticationScreenBackground(),
                AuthMethods(),
                Positioned(
                  bottom: 20,
                  child: SignUpText(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
