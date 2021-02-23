import 'package:flutter/cupertino.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/features/auth/presentation/widgets/third_party_authentication.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_subtitle.dart';

import 'email_authentication_form.dart';
import 'forgot_password_text.dart';

class AuthMethods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleWithSubtitle(
          titleText: "Welcome!",
          subtitleText: "please sign in to continue",
        ),
        SizedBox(height: 20),
        EmailAuthenticationForm(),
        SizedBox(height: 5),
        ForgotPasswordText(),
        TextDivider(text: localizations.translate("OR")),
        ThirdPartyAuthOptions(),
      ],
    );
  }
}
