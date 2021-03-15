import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'visible_categories_event.dart';
part 'visible_categories_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class VisibleCategoriesBloc extends Bloc<VisibleCategoriesEvent, VisibleCategoriesState> {
  final GetVisibleCategories _getVisibleCategories;

  VisibleCategoriesBloc(this._getVisibleCategories) : super(VisibleCategoriesLoading());

  @override
  Stream<VisibleCategoriesState> mapEventToState(
    VisibleCategoriesEvent event,
  ) async* {
    if (event is LoadVisibleCategories) yield VisibleCategoriesLoaded((await _getVisibleCategories()).toList());
  }
}
