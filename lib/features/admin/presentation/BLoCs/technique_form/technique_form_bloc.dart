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
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';
import 'package:optional/optional.dart';

part 'technique_form_event.dart';
part 'technique_form_state.dart';

/// Default state if no preloaded data have been given.
final _defaultFormState = TechniqueFormState(
  isPaid: false,
  idController: TextEditingController(),
  categoryController: DropdownButtonFormFieldController<String>(),
  difficultyController: DropdownButtonFormFieldController<TechniqueDifficulty>(),
  localizedData: {ENGLISH_CODE: TechniqueLocalizedData(languageCode: ENGLISH_CODE)},
  thumbnailController: ThumbnailPickerController(),
  videoController: VideoPickerController(),
);

/// State management for technique form.
/// The form can update existing techniques
/// and create new ones at the same time.
@Injectable(env: [Environment.prod, Environment.dev])
class TechniqueFormBloc extends Bloc<TechniqueFormEvent, TechniqueFormState> {
  final CreateTechnique _createTechnique;
  final UpdateTechnique _updateTechnique;
  final GetAllCategories _getAllCategories;
  final ErrorBloc _errorBloc;
  List<Category>? cachedCategories;

  TechniqueFormBloc(
    @factoryParam TechniqueFormState? initialState,
    this._getAllCategories,
    this._createTechnique,
    this._updateTechnique,
    this._errorBloc,
  ) : super(initialState ?? _defaultFormState);

  /// Load all categories form the database and cache them.
  Future<List<Category>> get categories async {
    if (cachedCategories == null) {
      final categories = await _getAllCategories();
      cachedCategories = categories.toList();
    }

    return cachedCategories!;
  }

  @override
  Stream<TechniqueFormState> mapEventToState(
    TechniqueFormEvent event,
  ) async* {
    if (event is UpdateTechniquePricing)
      // Update toggle switch.
      // Technique will be paid if switch is set.
      yield state.copyWith(isPaid: event.isPaid);
    else if (event is UpdateTechniqueLocalization) {
      // Update localized data.
      final localizedData = Map.of(state.localizedData);
      localizedData[event.techniqueLocalizedData.languageCode] = event.techniqueLocalizedData;
      yield state.copyWith(localizedData: localizedData);
    } else if (event is RemoveTechniqueLocalization) {
      // Remove localization of given [languageCode].
      final localizedData = Map.of(state.localizedData);
      localizedData.remove(event.languageCode);
      yield state.copyWith(localizedData: localizedData);
    } else if (event is UpdateTechniqueEvent) {
      final categoryId = state.categoryController.value;
      final difficulty = state.difficultyController.value;

      // Check for required fields.
      if ((state.isPaid && state.idController.text.isEmpty) || categoryId == null || difficulty == null) {
        _errorBloc.add(UserErrorEvent("Failed to create technique", "Please fill out all fields!"));
      } else {
        yield state.copyWith(formSubmitted: true);

        late final Optional<Media>? thumbnail;
        late final Optional<Media>? video;

        // Check if thumbnail has changed.
        if (event.technique.thumbnail.toNullable() == state.thumbnailController.image)
          thumbnail = null;
        else
          thumbnail = Optional.ofNullable(state.thumbnailController.image);

        // Check if video has changed.
        if (event.technique.video.toNullable() == state.videoController.video)
          video = null;
        else
          video = Optional.ofNullable(state.videoController.video);

        // Update technique.
        final technique = await _updateTechnique(
          id: event.technique.id,
          productId: state.isPaid ? Optional.of(state.idController.text) : Optional.empty(),
          categoryId: categoryId,
          difficulty: difficulty,
          localizedData: state.localizedData.entries.map((e) => e.value),
          thumbnail: thumbnail,
          video: video,
        );

        yield state.copyWith(success: technique);
      }
    } else if (event is CreateTechniqueEvent) {
      final categoryId = state.categoryController.value;
      final difficulty = state.difficultyController.value;

      // Check for required fields.
      if ((state.isPaid && state.idController.text.isEmpty) || categoryId == null || difficulty == null) {
        _errorBloc.add(UserErrorEvent("Failed to create technique", "Please fill out all fields!"));
      } else {
        yield state.copyWith(formSubmitted: true);

        // Create techinque.
        final technique = await _createTechnique(
          productId: state.isPaid ? Optional.ofNullable(state.idController.text) : Optional.empty(),
          categoryId: categoryId,
          difficulty: difficulty,
          localizedData: state.localizedData.entries.map((e) => e.value),
          thumbnail: Optional.ofNullable(state.thumbnailController.image),
          video: Optional.ofNullable(state.videoController.video),
        );

        yield state.copyWith(success: technique);
      }
    }
  }
}
