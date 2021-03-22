part of 'technique_detail_bloc.dart';

@immutable
abstract class TechniqueDetailState {}

class TechniqueDetailLoading extends TechniqueDetailState {}

class TechniqueDetailLoaded extends TechniqueDetailState {
  final Technique technique;
  final Optional<VideoPlayerController> videoPlayerController;

  TechniqueDetailLoaded({
    required this.technique,
    this.videoPlayerController = const Optional.empty(),
  });
}
