part of 'technique_local_storage_bloc.dart';

@immutable
class TechniqueLocalStorageState {
  final List<Technique> downloadedTechniques;

  TechniqueLocalStorageState({required this.downloadedTechniques});
}
