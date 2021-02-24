import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/icons.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_auth_button.dart';

class ThirdPartyAuthOptions extends StatelessWidget {
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
          // Facebook auth
          ThirdPartyAuthButton(
            icon: ImageIcon(
              AssetImage(FACEBOOK_ICON_LOCATION),
              color: Colors.white,
            ),
            colors: [
              Colors.blue,
              Colors.blueAccent,
              Colors.lightBlueAccent,
            ],
            onPressed: () => BlocProvider.of<ThirdPartyAuthBloc>(context).add(FacebookAuthEvent()),
          ),
          // Google auth
          ThirdPartyAuthButton(
            icon: ImageIcon(
              AssetImage(GOOGLE_ICON_LOCATION),
              color: Colors.white,
            ),
            colors: [
              Colors.red,
              Colors.redAccent,
              Colors.orange,
            ],
            onPressed: () => BlocProvider.of<ThirdPartyAuthBloc>(context).add(GoogleAuthEvent()),
          ),
          // Google auth
        ],
      ),
    );
  }
}
