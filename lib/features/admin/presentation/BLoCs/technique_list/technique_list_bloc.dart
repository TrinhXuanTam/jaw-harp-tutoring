import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_all_techniques.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'technique_list_event.dart';
part 'technique_list_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueListBloc extends Bloc<TechniqueListEvent, TechniqueListState> {
  final GetAllTechniques _getAllTechniques;

  TechniqueListBloc(this._getAllTechniques) : super(TechniqueListLoading());

  @override
  Stream<TechniqueListState> mapEventToState(
    TechniqueListEvent event,
  ) async* {
    if (event is LoadAllTechniques) {
      yield TechniqueListLoaded((await _getAllTechniques()).toList());
    }
  }
}
