import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_category.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/techniques/domain/entities/category_localized_data.dart';
import 'package:meta/meta.dart';

part 'create_category_event.dart';

part 'create_category_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CreateCategoryBloc extends Bloc<CreateCategoryEvent, CreateCategoryState> {
  final CreateCategory _createCategory;

  final Map<String, CategoryLocalizedData> localizedData = {"en": CategoryLocalizedData(languageCode: "en", title: "", description: "")};

  List<LanguageSideScrollGridItem> languageSideScrollGridItems(BuildContext ctx) {
    return localizedData.entries
        .map(
          (e) => LanguageSideScrollGridItem(
            languageCode: e.key,
            onTap: () => Navigator.pushNamed(
              ctx,
              CATEGORY_LOCALIZATION_EDIT_SCREEN_ROUTE,
              arguments: CategoryLocalizationEditScreenArgs(
                data: e.value,
                onSave: (localizedData) => this.add(EditCategoryLocalizationEvent(localizedData)),
                onRemove: () => this.add(RemoveCategoryLocalizationEvent(e.key)),
              ),
            ),
          ),
        )
        .toList();
  }

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
