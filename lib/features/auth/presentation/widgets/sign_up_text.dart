import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

/// Sign up text that redirects users to a sign up form.
class SignUpText extends StatelessWidget {
  const SignUpText();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(29),
      onTap: () => Navigator.pushNamed(context, SIGN_UP_SCREEN_ROUTE),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: RichText(
          text: TextSpan(
            text: l10n.translate("Don't have an Account?"),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            children: [
              WidgetSpan(
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Text(
                    l10n.translate("Sign Up"),
                    style: const TextStyle(
                      fontSize: 18,
                      color: BASE_COLOR,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
