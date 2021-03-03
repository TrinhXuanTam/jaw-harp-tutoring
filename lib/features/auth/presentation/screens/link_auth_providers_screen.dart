import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/facebook_button.dart';
import 'package:jews_harp/core/widgets/google_button.dart';
import 'package:jews_harp/core/widgets/one_button_alert_dialog.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/email_authentication/email_auth_bloc.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/third_party_authentication/third_party_auth_bloc.dart';

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

  void _wrongAccountHandler(BuildContext ctx) {
    final localizations = AppLocalizations.of(ctx);

    showDialog(
      context: ctx,
      builder: (_) {
        return OneButtonAlertDialog(
          title: localizations.translate("Failed to link accounts"),
          message: localizations.translate("Account emails don't match!\nPlease sign in to: ") + widget.email + ".",
        );
      },
    );
  }

  void _emailAuthBlocListener(BuildContext ctx, EmailAuthState state) {
    if (state is EmailAuthSuccessState) {
      if (state.user.email == widget.email) {
        widget.onSuccess();
      } else
        _wrongAccountHandler(ctx);
    }
  }

  void _thirdPartyAuthBlocListener(BuildContext ctx, ThirdPartyAuthState state) {
    if (state is ThirdPartyAuthSuccessState) {
      if (state.user.email == widget.email) {
        widget.onSuccess();
      } else
        _wrongAccountHandler(ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: IconAppBar(
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
                  Text(
                    localizations.translate("Link Accounts"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: localizations.translate("You've already used"),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        children: [
                          TextSpan(text: " ${widget.email} ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: localizations.translate("in the past. Please sign in with that account to continue:")),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  if (widget.providers.contains(EMAIL_PROVIDER))
                    Column(
                      children: [
                        RoundedPasswordField(
                          placeholderText: localizations.translate("Password"),
                          controller: _passwordController,
                        ),
                        SizedBox(height: 10),
                        RoundedButton(
                          text: localizations.translate("Continue"),
                          onPressed: () => _emailAuthBloc.add(EmailAuthenticationRequestEvent(widget.email, _passwordController.text)),
                        ),
                        if (widget.providers.length > 1) TextDivider(text: "OR"),
                      ],
                    ),
                  if (widget.providers.contains(FACEBOOK_PROVIDER))
                    Column(
                      children: [
                        FacebookButton(
                          text: "Continue with Facebook",
                          onPress: () => _thirdPartyAuthBloc.add(FacebookAuthEvent()),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  if (widget.providers.contains(GOOGLE_PROVIDER))
                    GoogleButton(
                      text: "Continue with Google",
                      onPress: () => _thirdPartyAuthBloc.add(GoogleAuthEvent()),
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
