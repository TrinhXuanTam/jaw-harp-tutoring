import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/facebook_button_mini.dart';
import 'package:jews_harp/core/widgets/google_button_mini.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/screens/link_auth_providers_screen.dart';

class ThirdPartyAuthOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThirdPartyAuthBloc>(
      create: (_) => serviceLocator<ThirdPartyAuthBloc>(),
      child: _Child(),
    );
  }
}

class _Child extends StatelessWidget {
  void _thirdPartyAuthBlocListener(BuildContext ctx, ThirdPartyAuthState state) {
    if (state is ThirdPartyAuthSuccessState) BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(state.user));
    if (state is MultipleProvidersState) {
      Navigator.pushNamed(
        ctx,
        LINK_AUTH_PROVIDERS_SCREEN_ROUTE,
        arguments: LinkAuthProvidersScreenArgs(
          email: state.email,
          providers: state.providers,
          onSuccess: () => BlocProvider.of<ThirdPartyAuthBloc>(ctx).add(LinkFacebookEvent()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThirdPartyAuthBloc, ThirdPartyAuthState>(
      listener: _thirdPartyAuthBlocListener,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FacebookButtonMini(onPress: () => BlocProvider.of<ThirdPartyAuthBloc>(context).add(FacebookAuthEvent())),
          SizedBox(width: 30),
          GoogleButtonMini(onPress: () => BlocProvider.of<ThirdPartyAuthBloc>(context).add(GoogleAuthEvent())),
        ],
      ),
    );
  }
}
