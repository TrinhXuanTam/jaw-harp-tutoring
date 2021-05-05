import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:meta/meta.dart';

part 'third_party_auth_event.dart';
part 'third_party_auth_state.dart';

/// Third party authentication methods state management.
@Injectable(env: [Environment.prod, Environment.dev])
class ThirdPartyAuthBloc extends Bloc<ThirdPartyAuthEvent, ThirdPartyAuthState> {
  final FacebookAuthentication _facebookAuthentication;
  final GoogleAuthentication _googleAuthentication;
  final GetAuthProviders _getAuthProviders;
  final AuthBloc _authBloc;

  ThirdPartyAuthBloc(
    this._facebookAuthentication,
    this._googleAuthentication,
    this._getAuthProviders,
    this._authBloc,
  ) : super(ThirdPartyAuthInitial());

  @override
  Stream<ThirdPartyAuthState> mapEventToState(
    ThirdPartyAuthEvent event,
  ) async* {
    if (event is FacebookAuthEvent) {
      try {
        // Sign in with Facebook profile.
        final user = await _facebookAuthentication();
        _authBloc.add(UserAuthenticatedEvent(user));
      } on EmailAlreadyUsedError catch (e) {
        // Redirect to account link screen.
        final providers = await _getAuthProviders(e.email);
        if (!providers.contains(FACEBOOK_PROVIDER)) {
          providers.remove(FACEBOOK_PROVIDER);
          yield MultipleProvidersState(e.email, providers);
        }
      } on BaseError {}
    } else if (event is GoogleAuthEvent) {
      try {
        // Sign in with Google account.
        final user = await _googleAuthentication();
        _authBloc.add(UserAuthenticatedEvent(user));
      } on BaseError {}
    }
  }
}
