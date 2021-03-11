import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_techniques_by_category.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:meta/meta.dart';

part 'category_detail_event.dart';

part 'category_detail_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CategoryDetailBloc extends Bloc<CategoryDetailEvent, CategoryDetailState> {
  final GetTechniquesByCategory _getTechniquesByCategory;
  final Category? category;

  @factoryMethod
  CategoryDetailBloc(@factoryParam this.category, this._getTechniquesByCategory) : super(CategoryDetailInitial());

  Future<List<Technique>> get techniques => _getTechniquesByCategory(category!).then((value) => value.toList());

  @override
  Stream<CategoryDetailState> mapEventToState(
    CategoryDetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
