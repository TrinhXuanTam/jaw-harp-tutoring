import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/application/get_categories.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final GetCategories _getCategories;

  CategoriesBloc(this._getCategories) : super(CategoriesLoading());

  @override
  Stream<CategoriesState> mapEventToState(
    CategoriesEvent event,
  ) async* {
    if (event is LoadCategories) {
      final categories = (await _getCategories()).toList();
      categories.sort((lhs, rhs) => rhs.techniqueIds.length.compareTo(lhs.techniqueIds.length));
      yield CategoriesLoaded(categories);
    }
  }
}
