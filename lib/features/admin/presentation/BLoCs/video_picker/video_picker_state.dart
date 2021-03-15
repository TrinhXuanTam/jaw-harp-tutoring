part of 'video_picker_bloc.dart';

@immutable
abstract class VideoPickerState {}

class NoVideoPickedState extends VideoPickerState {}

class VideoPickedState extends VideoPickerState {
  final Media video;
  final VideoPlayerController playableVideo;

  VideoPickedState(this.video, this.playableVideo);
}
