import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/auth_providers_id.dart';
import 'package:jews_harp/core/errors/base_error.dart';
import 'package:jews_harp/core/errors/email_already_used_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_authentication_providers.dart';
import 'package:jews_harp/features/auth/application/use_cases/google_authentication.dart';
import 'package:jews_harp/features/auth/application/use_cases/link_facebook_provider.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'third_party_auth_event.dart';

part 'third_party_auth_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class ThirdPartyAuthBloc extends Bloc<ThirdPartyAuthEvent, ThirdPartyAuthState> {
  final FacebookAuthentication _facebookAuthentication;
  final GoogleAuthentication _googleAuthentication;
  final GetAuthProviders _getAuthProviders;
  final LinkFacebookProvider _linkFacebookProvider;

  ThirdPartyAuthBloc(
    this._facebookAuthentication,
    this._googleAuthentication,
    this._getAuthProviders,
    this._linkFacebookProvider,
  ) : super(ThirdPartyAuthInitial());

  @override
  Stream<ThirdPartyAuthState> mapEventToState(
    ThirdPartyAuthEvent event,
  ) async* {
    if (event is FacebookAuthEvent) {
      try {
        final user = await _facebookAuthentication();
        yield ThirdPartyAuthSuccessState(user);
      } on EmailAlreadyUsedError catch (e) {
        final providers = await _getAuthProviders(e.email);

        if (!providers.contains(FACEBOOK_PROVIDER)) {
          providers.remove(FACEBOOK_PROVIDER);
          yield MultipleProvidersState(e.email, providers);
        }
      } on BaseError {
        // User closed the facebook login screen
      }
    } else if (event is GoogleAuthEvent) {
      try {
        final user = await _googleAuthentication();
        yield ThirdPartyAuthSuccessState(user);
      } on BaseError {}
    } else if (event is LinkFacebookEvent) {
      try {
        final user = await _linkFacebookProvider();
        yield ThirdPartyAuthSuccessState(user);
      } on BaseError {
        // User closed the google login screen
      }
    }
  }
}
