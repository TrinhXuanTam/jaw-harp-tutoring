import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/icons.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/widgets/title_with_icon.dart';

class LinkAuthProvidersScreen extends StatefulWidget {
  final String email;
  final Set<String> providers;
  final Function onSuccess;

  const LinkAuthProvidersScreen({
    Key key,
    @required this.email,
    @required this.providers,
    @required this.onSuccess,
  }) : super(key: key);

  @override
  _LinkAuthProvidersScreenState createState() => _LinkAuthProvidersScreenState();
}

class _LinkAuthProvidersScreenState extends State<LinkAuthProvidersScreen> {
  final _passwordController = TextEditingController();
  final _emailAuthBloc = serviceLocator<EmailAuthBloc>();
  final _thirdPartyAuthBloc = serviceLocator<ThirdPartyAuthBloc>();

  @override
  void dispose() {
    _emailAuthBloc.close();
    _thirdPartyAuthBloc.close();
    super.dispose();
  }

  void _emailAuthBlocListener(BuildContext ctx, EmailAuthState state) {
    if (state is EmailAuthSuccessState) {
      if (state.user.email == widget.email) {
        widget.onSuccess();
      } else {
        // TODO
      }
    }
  }

  void _thirdPartyAuthBlocListener(BuildContext ctx, ThirdPartyAuthState state) {
    if (state is ThirdPartyAuthSuccessState) {
      if (state.user.email == widget.email) {
        widget.onSuccess();
      } else {
        // TODO
      }
    }
  }

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
          MultiBlocProvider(
            providers: [
              BlocProvider<EmailAuthBloc>(create: (_) => _emailAuthBloc),
              BlocProvider<ThirdPartyAuthBloc>(create: (_) => _thirdPartyAuthBloc),
            ],
            child: MultiBlocListener(
              listeners: [
                BlocListener<EmailAuthBloc, EmailAuthState>(listener: _emailAuthBlocListener),
                BlocListener<ThirdPartyAuthBloc, ThirdPartyAuthState>(listener: _thirdPartyAuthBlocListener),
              ],
              child: Column(
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
                          controller: _passwordController,
                        ),
                        SizedBox(height: 10),
                        RoundedButton(
                          text: localizations.translate("Sign In"),
                          onPressed: () => EmailAuthenticationRequestEvent(widget.email, _passwordController.text),
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
                              onTap: () => _thirdPartyAuthBloc.add(FacebookAuthEvent()),
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
                      onTap: () => _thirdPartyAuthBloc.add(GoogleAuthEvent()),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
