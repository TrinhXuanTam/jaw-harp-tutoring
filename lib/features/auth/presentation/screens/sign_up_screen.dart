import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/link_auth_providers_screen.dart';
import 'package:jews_harp/features/auth/presentation/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  void _signUpBlocListener(BuildContext ctx, SignUpState state) {
    if (state is SignUpSuccessState)
      BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(state.user));
    else if (state is MultipleProvidersState)
      Navigator.pushNamed(
        ctx,
        LINK_AUTH_PROVIDERS_SCREEN_ROUTE,
        arguments: LinkAuthProvidersScreenArgs(
          email: state.email,
          providers: state.providers,
          onSuccess: () => BlocProvider.of<SignUpBloc>(ctx).add(LinkEmailEvent(state.email, state.password)),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (_) => serviceLocator<SignUpBloc>(),
      child: BlocListener<SignUpBloc, SignUpState>(
        listener: _signUpBlocListener,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          resizeToAvoidBottomInset: false,
          appBar: IconAppBar(
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
