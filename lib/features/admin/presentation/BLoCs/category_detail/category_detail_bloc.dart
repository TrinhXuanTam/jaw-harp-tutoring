import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart';
import 'package:jews_harp/features/admin/utils.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'category_detail_event.dart';

part 'category_detail_state.dart';

/// Category detail state management for loading all
/// contained techniques.
@Injectable(env: [Environment.prod, Environment.dev])
class CategoryDetailBloc extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final GetTechniquesByCategory _getTechniquesByCategory;

  CategoryDetailBloc(this._getTechniquesByCategory) : super(CategoryDetailLoading());

  @override
  Stream<CategoryDetailState> mapEventToState(
    CategoryDetailEvent event,
  ) async* {
    if (event is LoadTechniques) {
      yield CategoryDetailLoading();
      // Load techniques of this category.
      final techniques = (await _getTechniquesByCategory(event.category)).toList();
      techniques.sort(techniqueTitleCmp);
      yield CategoryDetailLoaded(event.category, techniques);
    }
  }
}
