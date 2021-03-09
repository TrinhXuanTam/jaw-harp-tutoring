import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

class CreateTechniqueScreen extends StatefulWidget {
  @override
  _CreateTechniqueScreenState createState() => _CreateTechniqueScreenState();
}

class _CreateTechniqueScreenState extends State<CreateTechniqueScreen> {
  final _idController = TextEditingController();
  final _thumbnailController = ThumbnailPickerController();
  final _videoController = VideoPickerController();
  final _createTechniqueBloc = serviceLocator<CreateTechniqueBloc>();
  final _categoryController = DropdownButtonFormFieldController<String>();
  final _difficultyController = DropdownButtonFormFieldController<TechniqueDifficulty>();

  @override
  void dispose() {
    _createTechniqueBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          BlocProvider<CreateTechniqueBloc>(
            create: (_) => _createTechniqueBloc,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TitleWithSubtitle(
                  titleText: "Create Technique",
                  titleSize: 35,
                  subtitleText: "Create a new technique",
                ),
                SizedBox(height: 20),
                RoundedTextField(
                  icon: Icons.attach_money_rounded,
                  controller: _idController,
                  placeholderText: "Product ID",
                ),
                SizedBox(height: 10),
                FutureBuilder<List<Category>>(
                  future: _createTechniqueBloc.categories,
                  builder: (ctx, snapshot) {
                    late final items;

                    if (snapshot.hasData) {
                      items = snapshot.data!
                          .map(
                            (e) => DropdownMenuItem<String>(
                              child: Row(
                                children: [
                                  Text(e.getLocalizedTitle(l10n.locale.languageCode)),
                                  SizedBox(width: 5),
                                  e.isVisible ? Icon(Icons.public, color: BASE_COLOR.withAlpha(100), size: 18) : Icon(Icons.public_off_rounded, color: Colors.grey, size: 18),
                                ],
                              ),
                              value: e.id,
                            ),
                          )
                          .toList();
                    } else {
                      items = [
                        DropdownMenuItem<String>(
                          child: Text("Loading categories..."),
                        )
                      ];
                    }

                    return RoundedDropdown<String>(items: items, placeholderText: "Category", icon: Icons.folder_open_rounded, controller: _categoryController);
                  },
                ),
                SizedBox(height: 10),
                RoundedDropdown<TechniqueDifficulty>(
                  items: TechniqueDifficulty.values
                      .map(
                        (e) => DropdownMenuItem<TechniqueDifficulty>(
                          value: e,
                          child: Text(e.string),
                        ),
                      )
                      .toList(),
                  placeholderText: "Difficulty",
                  icon: Icons.timelapse_rounded,
                  controller: _difficultyController,
                ),
                SizedBox(height: 15),
                Container(
                  width: size.width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upload files:",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Text(
                                  "Upload additional to improve the user experience.",
                                  textAlign: TextAlign.justify,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: Material(
                              color: BASE_COLOR,
                              child: InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  UPLOAD_FILES_SCREEN_ROUTE,
                                  arguments: UploadFilesScreenArgs(_thumbnailController, _videoController),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Icon(
                                    Icons.cloud_upload,
                                    color: BASE_COLOR_VERY_LIGHT,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Localization:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Translate your content into different languages.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 5),
                      BlocBuilder<CreateTechniqueBloc, CreateTechniqueState>(
                        builder: (ctx, state) => LanguageSideScrollGrid(
                          displayAddButton: SupportedLanguages.languages.length != _createTechniqueBloc.localizedData.length,
                          data: _createTechniqueBloc.localizedData.entries
                              .map(
                                (entry) => LanguageSideScrollGridItem(
                                  languageCode: entry.key,
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    TECHNIQUE_LOCALIZATION_EDIT_SCREEN_ROUTE,
                                    arguments: TechniqueLocalizationEditScreenArgs(
                                        data: entry.value,
                                        onSave: (localizedData) {
                                          _createTechniqueBloc.add(EditTechniqueLocalizationEvent(localizedData));
                                          Navigator.pop(ctx);
                                        },
                                        onRemove: () {
                                          _createTechniqueBloc.add(RemoveTechniqueLocalizationEvent(entry.key));
                                          Navigator.pop(ctx);
                                        }),
                                  ),
                                ),
                              )
                              .toList(),
                          onAddButtonTap: () => Navigator.pushNamed(context, TECHNIQUE_LOCALIZATION_ADD_SCREEN_ROUTE, arguments: TechniqueLocalizationAddScreenArgs(_createTechniqueBloc)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RoundedButton(
                  text: "Create",
                  onPressed: () {
                    _createTechniqueBloc.add(
                      CreateTechniqueFormSubmittedEvent(
                        id: _idController.text,
                        categoryId: _categoryController.value!,
                        difficulty: _difficultyController.value!,
                        thumbnail: _thumbnailController.image,
                        video: _videoController.video,
                      ),
                    );
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
