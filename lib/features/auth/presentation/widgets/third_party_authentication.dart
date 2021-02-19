import 'package:flutter/material.dart';
import 'package:jews_harp/core/utils/constants.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_auth_button.dart';

class ThirdPartyAuthOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ThirdPartyAuthButton(
          icon: ImageIcon(
            AssetImage(FACEBOOK_ICON_LOCATION),
            color: Colors.white,
          ),
          colors: [Colors.blue, Colors.blueAccent],
          onPressed: () {},
        ),
      ],
    );
  }
}
