part of 'thumbnail_picker_bloc.dart';

@immutable
abstract class ThumbnailPickerEvent {}

class PickImageEvent extends ThumbnailPickerEvent {}

class RemoveImageEvent extends ThumbnailPickerEvent {}
