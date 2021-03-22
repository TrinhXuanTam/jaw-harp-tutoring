import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:meta/meta.dart';
import 'package:optional/optional.dart';
import 'package:video_player/video_player.dart';

part 'technique_detail_event.dart';
part 'technique_detail_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueDetailBloc extends Bloc<TechniqueDetailEvent, TechniqueDetailState> {
  TechniqueDetailBloc() : super(TechniqueDetailLoading());

  @override
  Stream<TechniqueDetailState> mapEventToState(
    TechniqueDetailEvent event,
  ) async* {
    if (event is LoadTechniqueDetail) {
      final technique = event.technique;
      Optional<VideoPlayerController> videoController = Optional.empty();
      if (technique.video.isPresent) {
        videoController = Optional.of(getVideoPlayerControllerFromMedia(technique.video.value));
        await videoController.value.initialize();
      }
      yield TechniqueDetailLoaded(technique: technique, videoPlayerController: videoController);
    }
  }
}
