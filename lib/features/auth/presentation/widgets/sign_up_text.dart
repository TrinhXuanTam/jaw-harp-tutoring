import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/l10n.dart';

/// Sign up link
class SignUpText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return InkWell(
      onTap: () => Navigator.pushNamed(context, EMAIL_VERIFICATION_UP_SCREEN_ROUTE),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: RichText(
          text: TextSpan(
            text: localizations.translate("Don't have an Account?"),
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
            ),
            children: [
              WidgetSpan(
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: Text(
                    localizations.translate("Sign Up"),
                    style: TextStyle(
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
