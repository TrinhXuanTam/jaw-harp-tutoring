import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart';
import 'package:jews_harp/features/admin/utils.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'visible_categories_event.dart';
part 'visible_categories_state.dart';

/// State management for loading categories marked as visible.
@Injectable(env: [Environment.prod, Environment.dev])
class VisibleCategoriesBloc extends Bloc<VisibleCategoriesEvent, VisibleCategoriesState> {
  final GetVisibleCategories _getVisibleCategories;

  VisibleCategoriesBloc(this._getVisibleCategories) : super(VisibleCategoriesLoading());

  @override
  Stream<VisibleCategoriesState> mapEventToState(
    VisibleCategoriesEvent event,
  ) async* {
    if (event is LoadVisibleCategories) {
      final categories = (await _getVisibleCategories()).toList();
      // Sort categories by title.
      categories.sort(categoryTitleCmp);
      yield VisibleCategoriesLoaded(categories);
    }
  }
}
