import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_hidden_categories.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'hidden_categories_event.dart';
part 'hidden_categories_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class HiddenCategoriesBloc extends Bloc<HiddenCategoriesEvent, HiddenCategoriesState> {
  final GetHiddenCategories _getHiddenCategories;

  HiddenCategoriesBloc(this._getHiddenCategories) : super(HiddenCategoriesLoading());

  @override
  Stream<HiddenCategoriesState> mapEventToState(
    HiddenCategoriesEvent event,
  ) async* {
    if (event is LoadHiddenCategories) yield HiddenCategoriesLoaded((await _getHiddenCategories()).toList());
  }
}
