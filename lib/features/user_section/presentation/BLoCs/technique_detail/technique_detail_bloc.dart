import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/user_section/application/mark_technique_as_favorite.dart';
import 'package:jews_harp/features/user_section/application/remove_technique_from_favorites.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:meta/meta.dart';
import 'package:optional/optional.dart';
import 'package:video_player/video_player.dart';

part 'technique_detail_event.dart';
part 'technique_detail_state.dart';

/// Technique detail state management.
@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueDetailBloc extends Bloc<TechniqueDetailEvent, TechniqueDetailState> {
  final MarkTechniqueAsFavorite _markTechniqueAsFavorite;
  final RemoveTechniqueFromFavorites _removeTechniqueFromFavorites;

  TechniqueDetailBloc(this._markTechniqueAsFavorite, this._removeTechniqueFromFavorites) : super(TechniqueDetailLoading());

  @override
  Stream<TechniqueDetailState> mapEventToState(
    TechniqueDetailEvent event,
  ) async* {
    if (event is LoadTechniqueDetail) {
      final technique = event.technique;
      // Initialize video.
      Optional<VideoPlayerController> videoController = Optional.empty();
      if (technique.video.isPresent) {
        videoController = Optional.of(getVideoPlayerControllerFromMedia(technique.video.value));
        await videoController.value.initialize();
      }

      yield TechniqueDetailLoaded(technique: technique, videoPlayerController: videoController);
    } else if (event is MarkTechniqueAsFavoriteEvent) {
      // Mark technique as favorite.
      _markTechniqueAsFavorite(event.technique.id);
      event.user.favoriteTechniques.add(event.technique.id);
      yield state.copyWith();
    } else if (event is RemoveTechniqueFromFavoritesEvent) {
      // Remove technique from favorites.
      _removeTechniqueFromFavorites(event.technique.id);
      event.user.favoriteTechniques.remove(event.technique.id);
      yield state.copyWith();
    }
  }
}
