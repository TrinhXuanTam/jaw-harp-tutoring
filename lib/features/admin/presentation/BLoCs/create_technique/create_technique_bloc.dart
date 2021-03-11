import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/core/BLoCs/errors/error_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/features/admin/application/use_cases/create_technique.dart';
import 'package:jews_harp/features/admin/application/use_cases/get_all_categories.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:meta/meta.dart';

part 'create_technique_event.dart';

part 'create_technique_state.dart';

@Injectable(env: [Environment.prod, Environment.dev])
class CreateTechniqueBloc extends Bloc<CreateTechniqueEvent, CreateTechniqueState> {
  final localizedData = {"en": TechniqueLocalizedData(languageCode: "en", title: "", description: "", accompanyingText: "")};
  final difficultyController = DropdownButtonFormFieldController<TechniqueDifficulty>();
  final categoryController = DropdownButtonFormFieldController<String>();
  final thumbnailController = ThumbnailPickerController();
  final idController = TextEditingController();
  final videoController = VideoPickerController();

  final GetAllCategories _getAllCategories;
  final CreateTechnique _createTechnique;
  final ErrorBloc _errorBloc;

  Future<List<Category>> get categories => _getAllCategories().then((iterable) => iterable.toList());

  List<LanguageSideScrollGridItem> languageSideScrollGridItems(BuildContext ctx) {
    return localizedData.entries
        .map(
          (entry) => LanguageSideScrollGridItem(
            languageCode: entry.key,
            onTap: () => Navigator.pushNamed(
              ctx,
              TECHNIQUE_LOCALIZATION_EDIT_SCREEN_ROUTE,
              arguments: TechniqueLocalizationEditScreenArgs(
                data: entry.value,
                onSave: (localizedData) {
                  this.add(EditTechniqueLocalizationEvent(localizedData));
                  Navigator.pop(ctx);
                },
                onRemove: () {
                  this.add(RemoveTechniqueLocalizationEvent(entry.key));
                  Navigator.pop(ctx);
                },
              ),
            ),
          ),
        )
        .toList();
  }

  CreateTechniqueBloc(this._getAllCategories, this._createTechnique, this._errorBloc) : super(CreateTechniqueNotFinishedState());

  @override
  Stream<CreateTechniqueState> mapEventToState(
    CreateTechniqueEvent event,
  ) async* {
    if (event is AddTechniqueLocalizationEvent) {
      localizedData[event.techniqueLocalizedData.languageCode] = event.techniqueLocalizedData;
      yield CreateTechniqueNotFinishedState();
    } else if (event is RemoveTechniqueLocalizationEvent) {
      localizedData.remove(event.languageCode);
      yield CreateTechniqueNotFinishedState();
    } else if (event is EditTechniqueLocalizationEvent) {
      localizedData[event.techniqueLocalizedData.languageCode] = event.techniqueLocalizedData;
      yield CreateTechniqueNotFinishedState();
    }
    if (event is CreateTechniqueFormSubmittedEvent) {
      if (categoryController.value == null || difficultyController.value == null)
        _errorBloc.add(UserErrorEvent("Failed to create technique", "Please fill out all fields!"));
      else {
        _createTechnique(
          productId: event.isPaid ? idController.text : null,
          categoryId: categoryController.value!,
          difficulty: difficultyController.value!,
          localizedData: localizedData.entries.map((e) => e.value),
          thumbnail: thumbnailController.image,
          video: videoController.video,
        );
        yield CreateTechniqueFinishedState();
      }
    }
  }
}
