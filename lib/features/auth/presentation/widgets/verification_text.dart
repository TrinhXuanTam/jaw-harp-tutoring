import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/utils.dart';

/// Account verification informative text.
class VerificationText extends StatelessWidget {
  const VerificationText();

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      child: Column(
        children: [
          Text(
            l10n.translate("We have sent an email with a confirmation link to your email address. In order to complete the sign-up process, please click the confirmation link."),
            textAlign: TextAlign.justify,
            style: const TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: const TextStyle(fontSize: 15, color: Colors.black),
              text: l10n.translate("If you do not receive a confirmation email, please check your spam folder. Also, please verify that you entered a valid email address:"),
              children: [
                TextSpan(
                  text: ' "${getUser(context).email}."',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
