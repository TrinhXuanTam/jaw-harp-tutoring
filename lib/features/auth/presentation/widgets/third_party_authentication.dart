import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/icons.dart';
import 'package:jews_harp/features/auth/application/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/application/BLoCs/third_party_authentication/third_party_auth_bloc.dart';

class ThirdPartyAuthOptions extends StatelessWidget {
  final double _iconWidth = 45;

  void _thirdPartyAuthBlocListener(BuildContext context, ThirdPartyAuthState state) {
    if (state is ThirdPartyAuthSuccessState) BlocProvider.of<AuthBloc>(context).add(UserAuthenticatedEvent(state.user));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ThirdPartyAuthBloc, ThirdPartyAuthState>(
      listener: _thirdPartyAuthBlocListener,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(29),
            child: Image.asset(FACEBOOK_ICON_LOCATION, width: _iconWidth),
            onTap: () => BlocProvider.of<ThirdPartyAuthBloc>(context).add(FacebookAuthEvent()),
          ),
          SizedBox(width: 30),
          InkWell(
            borderRadius: BorderRadius.circular(29),
            child: Image.asset(GOOGLE_ICON_LOCATION, width: _iconWidth),
            onTap: () => BlocProvider.of<ThirdPartyAuthBloc>(context).add(GoogleAuthEvent()),
          ),
        ],
      ),
    );
  }
}
