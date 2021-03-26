import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'technique_local_storage_event.dart';
part 'technique_local_storage_state.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class TechniqueLocalStorageBloc extends Bloc<TechniqueLocalStorageEvent, TechniqueLocalStorageState> {
  @factoryParam
  factory TechniqueLocalStorageBloc.create() {
    return TechniqueLocalStorageBloc(TechniqueLocalStorageState(
      downloadedTechniques: [],
    ));
  }

  TechniqueLocalStorageBloc(TechniqueLocalStorageState initialState) : super(initialState);

  @override
  Stream<TechniqueLocalStorageState> mapEventToState(
    TechniqueLocalStorageEvent event,
  ) async* {}
}
