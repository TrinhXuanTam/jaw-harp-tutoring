import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/domain/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/authetication_screen/auth_screen_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/authentication_screen_background.dart';
import 'package:jews_harp/features/auth/presentation/widgets/email_authentication_form.dart';
import 'package:jews_harp/features/auth/presentation/widgets/text_divider.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_authentication.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocProvider(
        create: (_) => serviceLocator<AuthScreenBloc>(),
        child: BlocListener<AuthScreenBloc, AuthScreenState>(
          listener: (ctx, state) {
            if (state is AuthSuccessState)
              BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent());
            else if (state is AuthFailedState) print(state.message);
          },
          child: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AuthScreenBackground(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EmailAuthenticationForm(),
                    TextDivider(text: "OR"),
                    ThirdPartyAuthOptions(),
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
