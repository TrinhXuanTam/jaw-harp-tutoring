import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';

class PasswordResetSentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: IconAppBar(
        icon: Icons.close_rounded,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithIcon(
                icon: Icons.mark_email_unread_outlined,
                title: "Check your mail",
              ),
              Container(
                width: size.width * 0.7,
                child: Column(
                  children: [
                    Text(
                      localizations.translate("We have sent password recover instructions to your email."),
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: localizations.translate("If you do not receive the email, please check your spam folder or "),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        children: [
                          WidgetSpan(
                            child: InkWell(
                              onTap: () => Navigator.pushReplacementNamed(context, PASSWORD_RESET_SCREEN_ROUTE),
                              child: Text(
                                localizations.translate("try another email address."),
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: BASE_COLOR,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
