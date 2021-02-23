import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/icons.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/features/auth/domain/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_auth_button.dart';

class ThirdPartyAuthOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
          onPressed: () {
            print("pressed");
            serviceLocator<FacebookAuthentication>()();
          },
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
          onPressed: () {},
        ),
        // Google auth
      ],
    );
  }
}
