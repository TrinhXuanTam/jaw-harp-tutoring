import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/facebook_button.dart';
import 'package:jews_harp/core/widgets/google_button.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_password_field.dart';
import 'package:jews_harp/core/widgets/text_divider.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/link_providers/link_providers_bloc.dart';

class LinkAuthProvidersScreenArgs {
  final Set<String> providers;
  final LinkProvidersState initialState;

  LinkAuthProvidersScreenArgs({
    required this.providers,
    required this.initialState,
  });
}

/// Link two existing accounts screen.
class LinkAuthProvidersScreen extends StatelessWidget {
  final Set<String> providers;
  final LinkProvidersState initialState;

  factory LinkAuthProvidersScreen.fromArgs(LinkAuthProvidersScreenArgs args) {
    return LinkAuthProvidersScreen(
      providers: args.providers,
      initialState: args.initialState,
    );
  }

  const LinkAuthProvidersScreen({
    Key? key,
    required this.providers,
    required this.initialState,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: BlocProvider<LinkProvidersBloc>(
        create: (ctx) => serviceLocator<LinkProvidersBloc>(param1: initialState),
        child: CenteredStack(
          children: [
            Builder(
              builder: (ctx) {
                final bloc = BlocProvider.of<LinkProvidersBloc>(ctx);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      l10n.translate("Link Accounts"),
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                    Container(
                      width: size.width * 0.7,
                      child: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(
                          text: l10n.translate("You've already used"),
                          style: const TextStyle(fontSize: 15, color: Colors.black),
                          children: [
                            TextSpan(text: " ${bloc.state.email} ", style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(text: l10n.translate("in the past. Please sign in with that account to continue:")),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (providers.contains(EMAIL_PROVIDER))
                      Column(
                        children: [
                          RoundedPasswordField(
                            placeholderText: l10n.translate("Password"),
                            controller: bloc.state.passwordController,
                          ),
                          const SizedBox(height: 10),
                          RoundedButton(
                            text: l10n.translate("Continue"),
                            onPressed: () => bloc.add(EmailAuthenticationEvent()),
                          ),
                          if (providers.length > 1) const TextDivider(text: "OR"),
                        ],
                      ),
                    if (providers.contains(FACEBOOK_PROVIDER))
                      Column(
                        children: [
                          FacebookButton(
                            text: "Continue with Facebook",
                            onPress: () => bloc.add(FacebookAuthenticationEvent()),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    if (providers.contains(GOOGLE_PROVIDER))
                      GoogleButton(
                        text: "Continue with Google",
                        onPress: () => bloc.add(GoogleAuthenticationEvent()),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
