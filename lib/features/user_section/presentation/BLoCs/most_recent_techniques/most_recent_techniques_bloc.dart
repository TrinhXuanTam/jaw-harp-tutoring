import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/get_most_recent_techniques.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'most_recent_techniques_event.dart';
part 'most_recent_techniques_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class MostRecentTechniquesBloc extends Bloc<MostRecentTechniquesEvent, MostRecentTechniquesState> {
  final GetMostRecentTechniques _getMostRecentTechniques;

  MostRecentTechniquesBloc(this._getMostRecentTechniques) : super(MostRecentTechniquesLoading());

  @override
  Stream<MostRecentTechniquesState> mapEventToState(
    MostRecentTechniquesEvent event,
  ) async* {
    if (event is LoadMostRecentTechniques) yield MostRecentTechniquesLoaded((await _getMostRecentTechniques()).toList());
  }
}
