import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:meta/meta.dart';

part 'create_technique_event.dart';

part 'create_technique_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CreateTechniqueBloc extends Bloc<CreateTechniqueEvent, CreateTechniqueState> {
  final GetAllCategories _getAllCategories;
  final CreateTechnique _createTechnique;

  Future<List<Category>> get categories => _getAllCategories().then((iterable) => iterable.toList());

  CreateTechniqueBloc(this._getAllCategories, this._createTechnique) : super(CreateTechniqueInitial());

  final Map<String, TechniqueLocalizedData> localizedData = {
    "en": TechniqueLocalizedData(languageCode: "en", title: "", description: "", accompanyingText: ""),
  };

  @override
  Stream<CreateTechniqueState> mapEventToState(
    CreateTechniqueEvent event,
  ) async* {
    if (event is AddTechniqueLocalizationEvent) {
      localizedData[event.techniqueLocalizedData.languageCode] = event.techniqueLocalizedData;
      yield CreateTechniqueInitial();
    } else if (event is RemoveTechniqueLocalizationEvent) {
      localizedData.remove(event.languageCode);
      yield CreateTechniqueInitial();
    } else if (event is EditTechniqueLocalizationEvent) {
      localizedData[event.techniqueLocalizedData.languageCode] = event.techniqueLocalizedData;
      yield CreateTechniqueInitial();
    }
    if (event is CreateTechniqueFormSubmittedEvent) {
      _createTechnique(
        id: event.id,
        categoryId: event.categoryId,
        difficulty: event.difficulty,
        localizedData: localizedData.entries.map((e) => e.value),
        thumbnail: event.thumbnail,
        video: event.video,
      );
      yield CreateTechniqueInitial();
    }
  }
}
