import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart';
import 'package:jews_harp/features/admin/utils.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'hidden_categories_event.dart';

part 'hidden_categories_state.dart';

/// State management for loading categories marked as hidden.
@Injectable(env: [Environment.prod, Environment.dev])
class HiddenCategoriesBloc extends Bloc<HiddenCategoriesEvent, HiddenCategoriesState> {
  final GetHiddenCategories _getHiddenCategories;

  HiddenCategoriesBloc(this._getHiddenCategories) : super(HiddenCategoriesLoading());

  @override
  Stream<HiddenCategoriesState> mapEventToState(
    HiddenCategoriesEvent event,
  ) async* {
    if (event is LoadHiddenCategories) {
      final categories = (await _getHiddenCategories()).toList();
      // Sort categories by title.
      categories.sort(categoryTitleCmp);
      yield HiddenCategoriesLoaded(categories);
    }
  }
}
