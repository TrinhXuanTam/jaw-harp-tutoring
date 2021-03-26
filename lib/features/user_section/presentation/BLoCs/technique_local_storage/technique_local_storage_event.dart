part of 'technique_local_storage_bloc.dart';

@immutable
abstract class TechniqueLocalStorageEvent {}

class DownloadTechniqueEvent extends TechniqueLocalStorageEvent {
  final String techniqueId;

  DownloadTechniqueEvent(this.techniqueId);
}

class TechniqueDownloadCompletedEvent extends TechniqueLocalStorageEvent {
  final Technique technique;

  TechniqueDownloadCompletedEvent(this.technique);
}
