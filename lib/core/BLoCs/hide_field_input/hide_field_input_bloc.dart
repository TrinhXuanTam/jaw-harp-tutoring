import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'hide_field_input_event.dart';

part 'hide_field_input_state.dart';

/// Show or hide input field text
@injectable
class HideFieldInputBloc extends Bloc<HideFieldInputEvent, HideFieldInputState> {
  HideFieldInputBloc() : super(InputHiddenState());

  @override
  Stream<HideFieldInputState> mapEventToState(
    HideFieldInputEvent event,
  ) async* {
    if (event is ToggleVisibilityEvent) {
      if (state is InputHiddenState)
        yield InputVisibleState();
      else
        yield InputHiddenState();
    }
  }
}
