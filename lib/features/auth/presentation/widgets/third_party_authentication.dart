import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/icons.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';

class ThirdPartyAuthOptions extends StatelessWidget {
  final double _iconWidth = 45;
  final _thirdPartAuthBloc = serviceLocator<ThirdPartyAuthBloc>();

  void _thirdPartyAuthBlocListener(BuildContext ctx, ThirdPartyAuthState state) {
    if (state is ThirdPartyAuthSuccessState) BlocProvider.of<AuthBloc>(ctx).add(UserAuthenticatedEvent(state.user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThirdPartyAuthBloc>(
      create: (_) => _thirdPartAuthBloc,
      child: BlocListener<ThirdPartyAuthBloc, ThirdPartyAuthState>(
        listener: _thirdPartyAuthBlocListener,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(29),
              child: Image.asset(FACEBOOK_ICON_LOCATION, width: _iconWidth),
              onTap: () => _thirdPartAuthBloc.add(FacebookAuthEvent()),
            ),
            SizedBox(width: 30),
            InkWell(
              borderRadius: BorderRadius.circular(29),
              child: Image.asset(GOOGLE_ICON_LOCATION, width: _iconWidth),
              onTap: () => _thirdPartAuthBloc.add(GoogleAuthEvent()),
            ),
          ],
        ),
      ),
    );
  }
}
