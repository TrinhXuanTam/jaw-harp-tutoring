import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'error_event.dart';

part 'error_state.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class ErrorBloc extends Bloc<ErrorEvent, ErrorState> {
  ErrorBloc() : super(NoErrorState());

  @override
  Stream<ErrorState> mapEventToState(
    ErrorEvent event,
  ) async* {
    if (event is ErrorResolvedEvent) yield NoErrorState();
    if (event is UserErrorEvent) yield UserErrorOccurredState(event.title, event.message);
  }
}
