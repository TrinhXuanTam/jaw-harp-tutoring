import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'new_techniques_event.dart';
part 'new_techniques_state.dart';

class NewTechniquesBloc extends Bloc<NewTechniquesEvent, NewTechniquesState> {
  NewTechniquesBloc() : super(NewTechniquesInitial());

  @override
  Stream<NewTechniquesState> mapEventToState(
    NewTechniquesEvent event,
  ) async* {

  }
}
