import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:meta/meta.dart';

part 'create_technique_event.dart';

part 'create_technique_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CreateTechniqueBloc extends Bloc<CreateTechniqueEvent, CreateTechniqueState> {
  final GetAllCategories _getAllCategories;

  Future<List<Category>> get categories => _getAllCategories().then((iterable) => iterable.toList());

  CreateTechniqueBloc(this._getAllCategories) : super(CreateTechniqueInitial());

  final Map<String, TechniqueLocalizedData> localizedData = {"en": TechniqueLocalizedData("en", "", "", "")};

  @override
  Stream<CreateTechniqueState> mapEventToState(
    CreateTechniqueEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
