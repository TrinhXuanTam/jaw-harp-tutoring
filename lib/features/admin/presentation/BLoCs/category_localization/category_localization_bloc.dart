import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_category_localized_data.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'category_localization_event.dart';

part 'category_localization_state.dart';

/// Localization form state management for loading
/// category localized data.
@Injectable(env: [Environment.prod, Environment.dev])
class CategoryLocalizationBloc extends Bloc<CategoryLocalizationEvent, CategoryLocalizationState> {
  final GetCategoryLocalizedData _getCategoryLocalizedData;

  CategoryLocalizationBloc(this._getCategoryLocalizedData) : super(CategoryLocalizationLoading());

  @override
  Stream<CategoryLocalizationState> mapEventToState(
    CategoryLocalizationEvent event,
  ) async* {
    if (event is LoadCategoryLocalizedData) {
      yield CategoryLocalizationLoaded(await _getCategoryLocalizedData(event.category.id));
    }
  }
}
