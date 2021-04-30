import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/application/use_cases/get_current_user.dart';
import 'package:jews_harp/features/auth/application/use_cases/sign_out.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetCurrentUser _getCurrentUser;
  final SignOut _signOut;

  AuthBloc(
    this._getCurrentUser,
    this._signOut,
  ) : super(UserUnauthenticated());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is UserAuthenticatedEvent) {
      final user = await _getCurrentUser();

      if (user == null) throw UserNotSignedInError();

      yield UserAuthenticated(user);
    } else if (event is UserSignOutEvent) {
      await _signOut();
      yield UserUnauthenticated();
    }
  }
}
