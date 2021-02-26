import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
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
                  Text(
                    localizations.translate("Link Accounts"),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
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
                        Container(
                          width: size.width * 0.7,
                          child: Material(
                            elevation: 3,
                            child: InkWell(
                              child: Image.asset(FACEBOOK_BUTTON_LOCATION),
                              onTap: () => _thirdPartyAuthBloc.add(FacebookAuthEvent()),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  if (widget.providers.contains(GOOGLE_PROVIDER))
                    Container(
                      width: size.width * 0.7,
                      child: Material(
                        elevation: 3,
                        child: InkWell(
                          child: Image.asset(GOOGLE_BUTTON_LOCATION),
                          onTap: () => _thirdPartyAuthBloc.add(GoogleAuthEvent()),
                        ),
                      ),
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
