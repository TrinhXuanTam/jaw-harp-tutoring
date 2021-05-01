import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/facebook_button_mini.dart';
import 'package:jews_harp/core/widgets/google_button_mini.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/link_auth_providers_screen.dart';

/// Third party authentication methods in the sign up screen.
class ThirdPartyAuthOptions extends StatelessWidget {
  const ThirdPartyAuthOptions();

  void _thirdPartyAuthBlocListener(BuildContext ctx, ThirdPartyAuthState state) {
    if (state is MultipleProvidersState) {
      Navigator.pushNamed(
        ctx,
        LINK_AUTH_PROVIDERS_SCREEN_ROUTE,
        arguments: LinkAuthProvidersScreenArgs(
          providers: state.providers,
          initialState: LinkFacebook(state.email),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThirdPartyAuthBloc>(
      create: (_) => serviceLocator<ThirdPartyAuthBloc>(),
      child: Builder(
        builder: (ctx) => BlocListener<ThirdPartyAuthBloc, ThirdPartyAuthState>(
          listener: _thirdPartyAuthBlocListener,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FacebookButtonMini(onPress: () => BlocProvider.of<ThirdPartyAuthBloc>(ctx).add(FacebookAuthEvent())),
              const SizedBox(width: 30),
              GoogleButtonMini(onPress: () => BlocProvider.of<ThirdPartyAuthBloc>(ctx).add(GoogleAuthEvent())),
            ],
          ),
        ),
      ),
    );
  }
}
