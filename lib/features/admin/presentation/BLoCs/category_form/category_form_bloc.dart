import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart';
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:meta/meta.dart';
import 'package:optional/optional.dart';

part 'category_form_event.dart';

part 'category_form_state.dart';

/// Category form state management.
/// This form is used for updating categories
/// and creating new ones at the same time.
@Injectable(env: [Environment.prod, Environment.dev])
class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final CreateCategory _createCategory;
  final UpdateCategory _updateCategory;

  CategoryFormBloc(
    @factoryParam CategoryFormState? initialState,
    this._createCategory,
    this._updateCategory,
  ) : super(
          initialState ??
              CategoryFormState(
                isVisible: false,
                thumbnailController: ThumbnailPickerController(),
                localizedData: const {
                  ENGLISH_CODE: CategoryLocalizedData(languageCode: ENGLISH_CODE),
                },
              ),
        );

  @override
  Stream<CategoryFormState> mapEventToState(
    CategoryFormEvent event,
  ) async* {
    if (event is UpdateCategoryVisibility)
      // Update visibility.
      yield state.copyWith(isVisible: event.isVisible);
    else if (event is UpdateCategoryLocalization) {
      // Update localization.
      final localizedData = Map.of(state.localizedData);
      localizedData[event.categoryLocalizedData.languageCode] = event.categoryLocalizedData;
      yield state.copyWith(localizedData: localizedData);
    } else if (event is RemoveCategoryLocalization) {
      // Remove localization of a [languageCode].
      final localizedData = Map.of(state.localizedData);
      localizedData.remove(event.languageCode);
      yield state.copyWith(localizedData: localizedData);
    } else if (event is UpdateCategoryEvent) {
      yield state.copyWith(formSubmitted: true);

      late final Optional<Media>? thumbnail;

      // Check if thumbnail has changed.
      if (event.category.thumbnail.toNullable() == state.thumbnailController.image)
        thumbnail = null;
      else
        thumbnail = Optional.ofNullable(state.thumbnailController.image);

      // Update category.
      final category = await _updateCategory(
        event.category.id,
        isVisible: state.isVisible,
        thumbnail: thumbnail,
        localizedData: state.localizedData.entries.map((e) => e.value),
      );

      yield state.copyWith(success: category);
    } else if (event is CreateCategoryEvent) {
      yield state.copyWith(formSubmitted: true);

      // Create category.
      final Category category = await _createCategory(
        state.isVisible,
        Optional.ofNullable(state.thumbnailController.image),
        state.localizedData.entries.map((e) => e.value),
      );

      yield state.copyWith(success: category);
    }
  }
}
