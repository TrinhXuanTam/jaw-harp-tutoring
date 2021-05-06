import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';

User getUser(BuildContext context) {
  final state = BlocProvider.of<AuthBloc>(context).state;
  if (state is UserAuthenticated) {
    return state.user;
  } else
    throw UserNotSignedInError();
}
