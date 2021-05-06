import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/email_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_email_provider.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';

part 'link_providers_event.dart';
part 'link_providers_state.dart';

/// State management for linking two existing accounts.
@Injectable(env: [Environment.prod, Environment.dev])
class LinkProvidersBloc extends Bloc<LinkProvidersEvent, LinkProvidersState> {
  final FacebookAuthentication _facebookAuthentication;
  final GoogleAuthentication _googleAuthentication;
  final EmailAuthentication _emailAuthentication;
  final LinkFacebookProvider _linkFacebook;
  final LinkEmailProvider _linkEmail;
  final SignOut _signOut;
  final ErrorBloc _errorBloc;
  final AuthBloc _authBloc;

  LinkProvidersBloc(
    @factoryParam LinkProvidersState? initialState,
    this._facebookAuthentication,
    this._googleAuthentication,
    this._emailAuthentication,
    this._linkFacebook,
    this._linkEmail,
    this._signOut,
    this._errorBloc,
    this._authBloc,
  ) : super(initialState!);

  /// Check if two accounts have the same email and link accounts.
  Future<void> _checkEmail(User user) async {
    if (user.email == state.email) {
      // The linked account.
      late final User newUser;

      if (state is LinkEmail) {
        // Link current account to email and password.
        newUser = await _linkEmail(state.email, (state as LinkEmail).password);
      } else if (state is LinkFacebook) {
        // Link Current account to Facebook profile.
        newUser = await _linkFacebook();
      }

      // Sign in with the linked account.
      _authBloc.add(UserAuthenticatedEvent(newUser));
    } else {
      // Log out and show error dialog if emails don't match.
      _signOut();
      _errorBloc.add(
        UserErrorEvent(
          "Failed to link accounts",
          "Account emails don't match!\nPlease sign in to: " + state.email + ".",
        ),
      );
    }
  }

  @override
  Stream<LinkProvidersState> mapEventToState(
    LinkProvidersEvent event,
  ) async* {
    if (event is EmailAuthenticationEvent) {
      try {
        // Link accounts via email and password.
        final user = await _emailAuthentication(state.email, state.passwordController.text);
        _checkEmail(user);
      } on BaseError catch (e) {
        _errorBloc.add(UserErrorEvent("Failed to sign in", e.message));
      }
    } else if (event is FacebookAuthenticationEvent) {
      try {
        // Link accounts via Facebook profile.
        final user = await _facebookAuthentication();
        _checkEmail(user);
      } on BaseError {}
    } else if (event is GoogleAuthenticationEvent) {
      try {
        // Link accounts via Google account.
        final user = await _googleAuthentication();
        _checkEmail(user);
      } on BaseError {}
    }
  }
}
