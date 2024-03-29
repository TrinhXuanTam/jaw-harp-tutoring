import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/application/use_cases/reload_user.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// Global authentication state.
@LazySingleton(env: [Environment.prod, Environment.dev])
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final ReloadUser _reloadUser;
  final SignOut _signOut;

  AuthBloc(
    this._reloadUser,
    this._signOut,
  ) : super(UserUnauthenticated());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is ReloadUserData && state is UserAuthenticated) {
      final user = await _reloadUser();
      yield UserAuthenticated(user);
    } else if (event is UserAuthenticatedEvent) {
      yield UserAuthenticated(event.user);
    } else if (event is UserSignOutEvent) {
      await _signOut();
      yield UserUnauthenticated();
    }
  }
}
