part of 'video_picker_bloc.dart';

@immutable
abstract class VideoPickerEvent {}

class PickVideoEvent extends VideoPickerEvent {}

class RemoveVideoEvent extends VideoPickerEvent {}
