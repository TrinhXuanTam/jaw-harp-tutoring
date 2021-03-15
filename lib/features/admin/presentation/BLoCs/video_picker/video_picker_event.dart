part of 'video_picker_bloc.dart';

@immutable
abstract class VideoPickerEvent {}

class UploadScreenLoadedEvent extends VideoPickerEvent {
  final Media? video;

  UploadScreenLoadedEvent({this.video});
}

class PickVideoEvent extends VideoPickerEvent {}

class RemoveVideoEvent extends VideoPickerEvent {}
