import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'new_techniques_event.dart';

part 'new_techniques_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class NewTechniquesBloc extends Bloc<NewTechniquesEvent, NewTechniquesState> {
  final GetMostRecentTechniques _getMostRecentTechniques;

  NewTechniquesBloc(this._getMostRecentTechniques) : super(NewTechniquesLoading());

  @override
  Stream<NewTechniquesState> mapEventToState(
    NewTechniquesEvent event,
  ) async* {
    if (event is LoadNewTechniques) yield NewTechniquesLoaded((await _getMostRecentTechniques()).toList());
  }
}
