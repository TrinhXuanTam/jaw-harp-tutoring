import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'toggle_switch_event.dart';

part 'toggle_switch_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class ToggleSwitchBloc extends Bloc<ToggleSwitchEvent, ToggleSwitchState> {
  ToggleSwitchBloc() : super(ToggleSwitchOffState());

  @override
  Stream<ToggleSwitchState> mapEventToState(ToggleSwitchEvent event) async* {
    if (state is ToggleSwitchOnState)
      yield ToggleSwitchOffState();
    else
      yield ToggleSwitchOnState();
  }
}
