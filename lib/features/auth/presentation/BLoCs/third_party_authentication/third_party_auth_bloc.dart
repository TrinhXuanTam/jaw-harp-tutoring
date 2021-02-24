import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/third_party_auth_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/domain/use_cases/facebook_authentication.dart';
import 'package:jews_harp/features/auth/domain/use_cases/google_authentication.dart';
import 'package:meta/meta.dart';

part 'third_party_auth_event.dart';

part 'third_party_auth_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class ThirdPartyAuthBloc extends Bloc<ThirdPartyAuthEvent, ThirdPartyAuthState> {
  final FacebookAuthentication _facebookAuthentication;
  final GoogleAuthentication _googleAuthentication;

  ThirdPartyAuthBloc(this._facebookAuthentication, this._googleAuthentication) : super(ThirdPartyAuthInitial());

  @override
  Stream<ThirdPartyAuthState> mapEventToState(
    ThirdPartyAuthEvent event,
  ) async* {
    if (event is FacebookAuthEvent) {
      try {
        final user = await _facebookAuthentication();
        yield ThirdPartyAuthSuccessState(user);
      } on ThirdPartyAuthenticationError {}
    } else if (event is GoogleAuthEvent) {
      try {
        final user = await _googleAuthentication();
        yield ThirdPartyAuthSuccessState(user);
      } on ThirdPartyAuthenticationError {}
    }
  }
}
