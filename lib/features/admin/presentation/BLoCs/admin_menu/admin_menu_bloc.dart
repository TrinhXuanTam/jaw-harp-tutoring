import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_visible_categories.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'admin_menu_event.dart';
part 'admin_menu_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class AdminMenuBloc extends Bloc<AdminMenuEvent, AdminMenuState> {
  final GetVisibleCategories _getVisibleCategories;
  final GetHiddenCategories _getHiddenCategories;

  AdminMenuBloc(this._getVisibleCategories, this._getHiddenCategories) : super(AdminMenuInitialState());

  @override
  Stream<AdminMenuState> mapEventToState(
    AdminMenuEvent event,
  ) async* {
    if (event is LoadVisibleCategoriesEvent) {
      final categories = (await _getVisibleCategories()).toList();
      categories.sort((lhs, rhs) => lhs.techniqueIds.length.compareTo(rhs.techniqueIds.length));
      yield VisibleCategoriesLoadedState(categories);
    } else if (event is LoadHiddenCategoriesEvent) {
      final categories = (await _getHiddenCategories()).toList();
      categories.sort((lhs, rhs) => lhs.techniqueIds.length.compareTo(rhs.techniqueIds.length));
      yield HiddenCategoriesLoadedState(categories);
    }
  }
}
