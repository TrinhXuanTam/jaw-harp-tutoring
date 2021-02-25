import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/icons.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';

class LinkAuthProvidersScreen extends StatefulWidget {
  final Set<String> providers;
  final Function onSuccess;
  final Function onFailure;

  const LinkAuthProvidersScreen({
    Key key,
    @required this.providers,
    @required this.onSuccess,
    @required this.onFailure,
  }) : super(key: key);

  @override
  _LinkAuthProvidersScreenState createState() => _LinkAuthProvidersScreenState();
}

class _LinkAuthProvidersScreenState extends State<LinkAuthProvidersScreen> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: TransparentIconAppBar(
        icon: Icons.arrow_back_rounded,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithIcon(
                icon: Icons.add_circle_outline_rounded,
                title: "Link Accounts",
              ),
              Container(
                width: size.width * 0.7,
                child: Text(
                  "You've already used this account. To continue please sign in to that account:",
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              if (widget.providers.contains("password"))
                Column(
                  children: [
                    RoundedPasswordField(
                      placeholderText: localizations.translate("Password"),
                      controller: passwordController,
                    ),
                    SizedBox(height: 10),
                    RoundedButton(
                      text: localizations.translate("Sign In"),
                      onPressed: () {},
                    ),
                    TextDivider(text: "OR"),
                  ],
                ),
              if (widget.providers.contains("facebook.com"))
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(29),
                          child: Image.asset(FACEBOOK_ICON_LOCATION, width: 45),
                          onTap: () {},
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                  ],
                ),
              if (widget.providers.contains("google.com"))
                InkWell(
                  borderRadius: BorderRadius.circular(29),
                  child: Image.asset(GOOGLE_ICON_LOCATION, width: 45),
                  onTap: () {},
                ),
            ],
          ),
        ],
      ),
    );
  }
}
