import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/get_technique_by_Id.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'technique_event.dart';

part 'technique_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueBloc extends Bloc<TechniqueEvent, TechniqueState> {
  final GetTechniqueById _getTechniqueById;

  TechniqueBloc(this._getTechniqueById) : super(TechniqueLoading());

  @override
  Stream<TechniqueState> mapEventToState(
    TechniqueEvent event,
  ) async* {
    if (event is LoadTechnique) yield TechniqueLoaded(await _getTechniqueById(event.id));
  }
}
