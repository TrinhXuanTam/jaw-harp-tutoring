import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';

class ThirdPartyAuthOptions extends StatefulWidget {
  @override
  _ThirdPartyAuthOptionsState createState() => _ThirdPartyAuthOptionsState();
}

class _ThirdPartyAuthOptionsState extends State<ThirdPartyAuthOptions> {
  final double _iconWidth = 45;

  final _thirdPartyAuthBloc = serviceLocator<ThirdPartyAuthBloc>();

  void _thirdPartyAuthBlocListener(BuildContext ctx, ThirdPartyAuthState state) {
    if (state is ThirdPartyAuthSuccessState) BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(state.user));
    if (state is MultipleProvidersState) {
      Navigator.pushNamed(
        ctx,
        LINK_AUTH_PROVIDERS_SCREEN_ROUTE,
        arguments: {
          "email": state.email,
          "providers": state.providers,
          "onSuccess": () => _thirdPartyAuthBloc.add(LinkFacebookEvent()),
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThirdPartyAuthBloc>(
      create: (_) => _thirdPartyAuthBloc,
      child: BlocListener<ThirdPartyAuthBloc, ThirdPartyAuthState>(
        listener: _thirdPartyAuthBlocListener,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(29),
              child: Image.asset(FACEBOOK_ICON_LOCATION, width: _iconWidth),
              onTap: () => _thirdPartyAuthBloc.add(FacebookAuthEvent()),
            ),
            SizedBox(width: 30),
            InkWell(
              borderRadius: BorderRadius.circular(29),
              child: Image.asset(GOOGLE_ICON_LOCATION, width: _iconWidth),
              onTap: () => _thirdPartyAuthBloc.add(GoogleAuthEvent()),
            ),
          ],
        ),
      ),
    );
  }
}
