import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/sign_up_screen/sign_up_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/link_auth_providers_screen.dart';
import 'package:jews_harp/features/auth/presentation/widgets/sign_up_form.dart';

/// Sign up with email and password screen.
class SignUpScreen extends StatelessWidget {
  void _signUpBlocListener(BuildContext ctx, SignUpState state) {
    if (state is MultipleProvidersState)
      Navigator.pushNamed(
        ctx,
        LINK_AUTH_PROVIDERS_SCREEN_ROUTE,
        arguments: LinkAuthProvidersScreenArgs(
          providers: state.providers,
          initialState: LinkEmail(state.email, state.password),
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
                  const TitleWithSubtitle(
                    titleText: "Sign Up",
                    subtitleText: "create a new account",
                  ),
                  const SizedBox(height: 20),
                  const SignUpForm(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
