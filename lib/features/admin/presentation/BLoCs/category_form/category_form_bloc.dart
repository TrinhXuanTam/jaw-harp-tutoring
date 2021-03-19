import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart';
import 'package:jews_harp/features/admin/application/use_cases/update_category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category_localized_data.dart';
import 'package:meta/meta.dart';

part 'category_form_event.dart';
part 'category_form_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CategoryFormBloc extends Bloc<CategoryFormEvent, CategoryFormState> {
  final CreateCategory _createCategory;
  final UpdateCategory _updateCategory;

  CategoryFormBloc(
    @factoryParam CategoryFormState? initialState,
    this._createCategory,
    this._updateCategory,
  ) : super(initialState ?? CategoryFormState(isVisible: false, localizedData: const {ENGLISH_CODE: CategoryLocalizedData(languageCode: ENGLISH_CODE)}));

  @override
  Stream<CategoryFormState> mapEventToState(
    CategoryFormEvent event,
  ) async* {
    if (event is UpdateCategoryVisibility)
      yield state.copyWith(isVisible: event.isVisible);
    else if (event is UpdateCategoryLocalization) {
      final localizedData = Map.of(state.localizedData);
      localizedData[event.categoryLocalizedData.languageCode] = event.categoryLocalizedData;
      yield state.copyWith(localizedData: localizedData);
    } else if (event is RemoveCategoryLocalization) {
      final localizedData = Map.of(state.localizedData);
      localizedData.remove(event.languageCode);
      yield state.copyWith(localizedData: localizedData);
    } else if (event is CreateCategoryEvent) {
      final category = await _createCategory(state.isVisible, state.localizedData.entries.map((e) => e.value));
      yield state.copyWith(success: category);
    } else if (event is UpdateCategoryEvent) {
      final updatedCategory = await _updateCategory(
        event.category.id,
        isVisible: state.isVisible,
        localizedData: state.localizedData.entries.map((e) => e.value),
      );
      yield state.copyWith(success: updatedCategory);
    }
  }
}
