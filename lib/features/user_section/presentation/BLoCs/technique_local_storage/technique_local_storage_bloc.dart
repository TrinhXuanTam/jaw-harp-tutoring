import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/delete_downloaded_technique.dart';
import 'package:jews_harp/features/user_section/application/download_technique.dart';
import 'package:jews_harp/features/user_section/application/get_downloaded_techniques.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'technique_local_storage_event.dart';
part 'technique_local_storage_state.dart';

/// Local storage state management.
@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueLocalStorageBloc extends Bloc<TechniqueLocalStorageEvent, TechniqueLocalStorageState> {
  final DownloadTechnique _downloadTechnique;
  final GetDownloadedTechniques _getDownloadedTechniques;
  final DeleteDownloadedTechnique _deleteDownloadedTechnique;

  TechniqueLocalStorageBloc(
    this._downloadTechnique,
    this._getDownloadedTechniques,
    this._deleteDownloadedTechnique,
  ) : super(TechniqueLocalStorageState());

  @override
  Stream<TechniqueLocalStorageState> mapEventToState(TechniqueLocalStorageEvent event) async* {
    if (event is InitTechniqueLocalStorage) {
      // Get all downloaded techniques.
      final downloadedTechniques = await _getDownloadedTechniques();
      final downloadedTechniquesCopy = Map.of(state.downloadedTechniques);

      for (final technique in downloadedTechniques) {
        if (!downloadedTechniquesCopy.containsKey(technique.id)) {
          downloadedTechniquesCopy[technique.id] = technique;
        }
      }

      yield state.copyWith(downloadedTechniques: downloadedTechniquesCopy);
    } else if (event is DownloadTechniqueEvent) {
      // Download a new technique to local storage.
      yield state.copyWith(downloadingInProgress: state.downloadingInProgress.toSet()..add(event.techniqueId));

      final technique = await _downloadTechnique(event.techniqueId);
      final downloadedTechniquesCopy = Map.of(state.downloadedTechniques);
      downloadedTechniquesCopy[technique.id] = technique;

      yield state.copyWith(
        downloadedTechniques: downloadedTechniquesCopy,
        downloadingInProgress: state.downloadingInProgress.toSet()..remove(technique.id),
      );
    } else if (event is DeleteDownloadedTechniqueEvent) {
      // Delete a technique from local storage.
      final downloadedTechniquesCopy = Map.of(state.downloadedTechniques);
      downloadedTechniquesCopy.remove(event.techniqueId);
      _deleteDownloadedTechnique(event.techniqueId);
      yield state.copyWith(downloadedTechniques: downloadedTechniquesCopy);
    }
  }
}
