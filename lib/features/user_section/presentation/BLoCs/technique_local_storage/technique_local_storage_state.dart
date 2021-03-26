part of 'technique_local_storage_bloc.dart';

@immutable
class TechniqueLocalStorageState {
  final Map<String, Technique> downloadedTechniques;
  final Set<String> downloadingInProgress;

  TechniqueLocalStorageState({
    required this.downloadedTechniques,
    this.downloadingInProgress = const {},
  });

  TechniqueLocalStorageState copyWith({
    Map<String, Technique>? downloadedTechniques,
    Set<String>? downloadingInProgress,
  }) {
    return TechniqueLocalStorageState(
      downloadedTechniques: downloadedTechniques != null ? downloadedTechniques : this.downloadedTechniques,
      downloadingInProgress: downloadingInProgress != null ? downloadingInProgress : this.downloadingInProgress,
    );
  }
}
