import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/download_technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'technique_local_storage_event.dart';
part 'technique_local_storage_state.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class TechniqueLocalStorageBloc extends Bloc<TechniqueLocalStorageEvent, TechniqueLocalStorageState> {
  final DownloadTechnique _downloadTechnique;

  @factoryMethod
  factory TechniqueLocalStorageBloc.create(DownloadTechnique downloadTechnique) {
    return TechniqueLocalStorageBloc(
      TechniqueLocalStorageState(
        downloadedTechniques: {},
      ),
      downloadTechnique,
    );
  }

  TechniqueLocalStorageBloc(TechniqueLocalStorageState initialState, this._downloadTechnique) : super(initialState);

  @override
  Stream<TechniqueLocalStorageState> mapEventToState(
    TechniqueLocalStorageEvent event,
  ) async* {
    if (event is DownloadTechniqueEvent) {
      yield state.copyWith(downloadingInProgress: state.downloadingInProgress.toSet()..add(event.techniqueId));
      _downloadTechnique(event.techniqueId).then((technique) => this.add(TechniqueDownloadCompletedEvent(technique)));
    } else if (event is TechniqueDownloadCompletedEvent) {
      final downloadedTechniques = Map.of(state.downloadedTechniques);
      downloadedTechniques[event.technique.id] = event.technique;
      yield state.copyWith(
        downloadedTechniques: downloadedTechniques,
        downloadingInProgress: state.downloadingInProgress.toSet()..remove(event.technique.id),
      );
    }
  }
}
