part of 'technique_local_storage_bloc.dart';

@immutable
abstract class TechniqueLocalStorageEvent {}

class InitTechniqueLocalStorage extends TechniqueLocalStorageEvent {}

class DownloadTechniqueEvent extends TechniqueLocalStorageEvent {
  final String techniqueId;

  DownloadTechniqueEvent(this.techniqueId);
}