import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

/// Forgotten password link
class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(29),
      onTap: () => Navigator.pushNamed(context, PASSWORD_RESET_SCREEN_ROUTE),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        child: Text(
          l10n.translate("Forgot Password?"),
          style: TextStyle(
            color: BASE_COLOR,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
