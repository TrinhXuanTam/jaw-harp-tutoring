part of 'technique_detail_bloc.dart';

@immutable
abstract class TechniqueDetailState {
  TechniqueDetailState copyWith();
}

class TechniqueDetailLoading extends TechniqueDetailState {
  @override
  TechniqueDetailLoading copyWith() => TechniqueDetailLoading();
}

class TechniqueDetailLoaded extends TechniqueDetailState {
  final Technique technique;
  final Optional<VideoPlayerController> videoPlayerController;

  TechniqueDetailLoaded({
    required this.technique,
    this.videoPlayerController = const Optional.empty(),
  });

  @override
  TechniqueDetailLoaded copyWith({
    Technique? technique,
    Optional<VideoPlayerController>? videoPlayerController,
  }) {
    return TechniqueDetailLoaded(
      technique: technique != null ? technique : this.technique,
      videoPlayerController: videoPlayerController != null ? videoPlayerController : this.videoPlayerController,
    );
  }
}
