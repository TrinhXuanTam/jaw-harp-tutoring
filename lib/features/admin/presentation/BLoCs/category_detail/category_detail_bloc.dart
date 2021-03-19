import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'category_detail_event.dart';
part 'category_detail_state.dart';

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
      final techniques = await _getTechniquesByCategory(event.category);
      yield CategoryDetailLoaded(event.category, techniques.toList());
    }
  }
}
