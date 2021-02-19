import 'package:flutter/material.dart';
import 'package:jews_harp/core/utils/constants.dart';
import 'package:jews_harp/features/auth/presentation/widgets/email_authentication_form.dart';
import 'package:jews_harp/features/auth/presentation/widgets/text_divider.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_authentication.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailAuthenticationForm(),
                TextDivider(text: "OR"),
                ThirdPartyAuthOptions(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
