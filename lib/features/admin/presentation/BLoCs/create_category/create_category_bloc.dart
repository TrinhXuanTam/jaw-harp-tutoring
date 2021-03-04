import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:meta/meta.dart';

part 'create_category_event.dart';

part 'create_category_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final CreateCategory _createCategory;

  final Map<String, CategoryLocalizedData> localizedData = {
    "en": CategoryLocalizedData("en", "", ""),
  };

  CreateCategoryBloc(this._createCategory) : super(CreateCategoryNotFinishedState());

  @override
  Stream<CreateCategoryState> mapEventToState(
    CreateCategoryEvent event,
  ) async* {
    if (event is AddCategoryLocalizationEvent) {
      localizedData[event.categoryLocalizedData.languageCode] = event.categoryLocalizedData;
      yield CreateCategoryNotFinishedState();
    } else if (event is RemoveCategoryLocalizationEvent) {
      localizedData.remove(event.languageCode);
      yield CreateCategoryNotFinishedState();
    } else if (event is EditCategoryLocalizationEvent) {
      localizedData[event.categoryLocalizedData.languageCode] = event.categoryLocalizedData;
      yield CreateCategoryNotFinishedState();
    } else if (event is CreateCategoryFormSubmittedEvent) {
      await _createCategory(event.isVisible, localizedData.entries.map((e) => e.value));
      yield CreateCategoryFinishedState();
    }
  }
}
