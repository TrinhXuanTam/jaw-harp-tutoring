part of 'thumbnail_picker_bloc.dart';

@immutable
abstract class ThumbnailPickerEvent {}

class UploadScreenLoadedEvent extends ThumbnailPickerEvent {
  final Media? image;

  UploadScreenLoadedEvent({this.image});
}

class PickImageEvent extends ThumbnailPickerEvent {}

class RemoveImageEvent extends ThumbnailPickerEvent {}
