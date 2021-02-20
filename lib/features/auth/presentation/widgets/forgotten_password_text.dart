import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants.dart';
import 'package:jews_harp/core/l10n.dart';

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(
          localizations.translate("Forgot Password?"),
          style: TextStyle(
            color: BASE_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
