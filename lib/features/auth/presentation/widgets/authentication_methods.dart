import 'package:flutter/cupertino.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/features/auth/presentation/widgets/email_authentication_form.dart';
import 'package:jews_harp/features/auth/presentation/widgets/forgot_password_text.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_authentication.dart';

/// Authentication methods.
class AuthMethods extends StatelessWidget {
  const AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TitleWithSubtitle(
          titleText: "Welcome!",
          subtitleText: "please sign in to continue",
        ),
        const SizedBox(height: 20),
        const EmailAuthenticationForm(),
        const SizedBox(height: 5),
        const ForgotPasswordText(),
        const TextDivider(text: "OR"),
        const ThirdPartyAuthOptions(),
      ],
    );
  }
}
