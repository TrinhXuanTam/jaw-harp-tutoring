import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';

class VerificationText extends StatelessWidget {
  final String email;

  const VerificationText({
    Key? key,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localizations = AppLocalizations.of(context);
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.7,
      child: Column(
        children: [
          Text(
            localizations.translate("We have sent an email with a confirmation link to your email address. In order to complete the sign-up process, please click the confirmation link."),
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(height: 10),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(fontSize: 15, color: Colors.black),
              text: localizations.translate("If you do not receive a confirmation email, please check your spam folder. Also, please verify that you entered a valid email address:"),
              children: [
                TextSpan(
                  text: ' "${this.email}."',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
