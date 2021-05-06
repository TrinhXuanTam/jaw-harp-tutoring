import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:meta/meta.dart';
import 'package:video_player/video_player.dart';

part 'video_picker_event.dart';
part 'video_picker_state.dart';

/// Video picker state management.
@Injectable(env: [Environment.prod, Environment.dev])
class VideoPickerBloc extends Bloc<VideoPickerEvent, VideoPickerState> {
  final PickVideo _pickVideo;

  VideoPickerBloc(this._pickVideo) : super(NoVideoPickedState());

  @override
  Stream<VideoPickerState> mapEventToState(VideoPickerEvent event) async* {
    if (event is UploadScreenLoadedEvent) {
      final video = event.video;
      if (video == null)
        yield NoVideoPickedState();
      else {
        final playableVideo = getVideoPlayerControllerFromMedia(video);
        await playableVideo.initialize();
        yield VideoPickedState(video, playableVideo);
      }
    } else if (event is PickVideoEvent) {
      // Open the file browser and pick video.
      final video = await _pickVideo();
      if (video == null)
        yield NoVideoPickedState();
      else {
        final playableVideo = getVideoPlayerControllerFromMedia(video);
        await playableVideo.initialize();
        yield VideoPickedState(video, playableVideo);
      }
    } else if (event is RemoveVideoEvent) {
      yield NoVideoPickedState();
    }
  }
}
