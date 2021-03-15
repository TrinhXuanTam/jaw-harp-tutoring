part of 'thumbnail_picker_bloc.dart';

@immutable
abstract class ThumbnailPickerState {}

class NoImagePickedState extends ThumbnailPickerState {}

class ImagePickedState extends ThumbnailPickerState {
  final Media image;

  ImagePickedState(this.image);
}
