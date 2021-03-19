import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart';
import 'package:jews_harp/features/admin/application/use_cases/update_technique.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique_localized_data.dart';
import 'package:meta/meta.dart';
import 'package:optional/optional.dart';

part 'technique_form_event.dart';
part 'technique_form_state.dart';

final _defaultFormState = TechniqueFormState(
  isPaid: false,
  idController: TextEditingController(),
  categoryController: DropdownButtonFormFieldController<String>(),
  difficultyController: DropdownButtonFormFieldController<TechniqueDifficulty>(),
  localizedData: {ENGLISH_CODE: TechniqueLocalizedData(languageCode: ENGLISH_CODE)},
  thumbnailController: ThumbnailPickerController(),
  videoController: VideoPickerController(),
);

@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueFormBloc extends Bloc<TechniqueFormEvent, TechniqueFormState> {
  final CreateTechnique _createTechnique;
  final UpdateTechnique _updateTechnique;
  final GetAllCategories _getAllCategories;
  final ErrorBloc _errorBloc;

  TechniqueFormBloc(
    @factoryParam TechniqueFormState? initialState,
    this._getAllCategories,
    this._createTechnique,
    this._updateTechnique,
    this._errorBloc,
  ) : super(initialState != null ? initialState : _defaultFormState);

  Future<List<Category>> get categories => _getAllCategories().then((iterable) => iterable.toList());

  @override
  Stream<TechniqueFormState> mapEventToState(
    TechniqueFormEvent event,
  ) async* {
    if (event is UpdateTechniquePricing)
      yield state.copyWith(isPaid: event.isPaid);
    else if (event is UpdateTechniqueLocalization) {
      final localizedData = Map.of(state.localizedData);
      localizedData[event.techniqueLocalizedData.languageCode] = event.techniqueLocalizedData;
      yield state.copyWith(localizedData: localizedData);
    } else if (event is RemoveTechniqueLocalization) {
      final localizedData = Map.of(state.localizedData);
      localizedData.remove(event.languageCode);
      yield state.copyWith(localizedData: localizedData);
    } else if (event is CreateTechniqueEvent || event is UpdateTechniqueEvent) {
      final categoryId = state.categoryController.value;
      final difficulty = state.difficultyController.value;

      if ((state.isPaid && state.idController.text.isEmpty) || categoryId == null || difficulty == null)
        _errorBloc.add(UserErrorEvent("Failed to create technique", "Please fill out all fields!"));
      else {
        late final technique;
        if (event is CreateTechniqueEvent)
          technique = await _createTechnique(
            productId: state.isPaid ? Optional.ofNullable(state.idController.text) : Optional.empty(),
            categoryId: categoryId,
            difficulty: difficulty,
            localizedData: state.localizedData.entries.map((e) => e.value),
            thumbnail: Optional.ofNullable(state.thumbnailController.image),
            video: Optional.ofNullable(state.videoController.video),
          );
        else if (event is UpdateTechniqueEvent) {
          late final Optional<Media>? thumbnail;
          late final Optional<Media>? video;

          if (event.technique.thumbnail.toNullable() == state.thumbnailController.image)
            thumbnail = null;
          else
            thumbnail = state.thumbnailController.image != null ? Optional.of(state.thumbnailController.image!) : Optional.empty();

          if (event.technique.video.toNullable() == state.videoController.video)
            video = null;
          else
            video = state.videoController.video != null ? Optional.of(state.videoController.video!) : Optional.empty();

          technique = await _updateTechnique(
            event.technique.id,
            productId: state.isPaid ? Optional.of(state.idController.text) : Optional.empty(),
            categoryId: state.categoryController.value,
            difficulty: state.difficultyController.value,
            localizedData: state.localizedData.entries.map((e) => e.value),
            thumbnail: thumbnail,
            video: video,
          );
        }
        yield state.copyWith(success: technique);
      }
    }
  }
}
