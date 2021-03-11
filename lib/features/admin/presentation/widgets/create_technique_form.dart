import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/BLoCs/toggle_switch/toggle_switch_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/create_technique/create_technique_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

class CreateTechniqueForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final createTechniqueBloc = BlocProvider.of<CreateTechniqueBloc>(context);
    // ignore: close_sinks
    final toggleSwitchBloc = BlocProvider.of<ToggleSwitchBloc>(context);
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);
    final visibleIcon = Icon(Icons.public, color: BASE_COLOR.withAlpha(100), size: 18);
    final hiddenIcon = Icon(Icons.public_off_rounded, color: Colors.grey, size: 18);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleWithSubtitle(
          titleText: "Create Technique",
          titleSize: 35,
          subtitleText: "Create a new technique",
        ),
        SizedBox(height: 20),
        Container(
          width: size.width * 0.75,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paid:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      "User has to pay for access to this technique.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50),
              BlocBuilder<ToggleSwitchBloc, ToggleSwitchState>(
                builder: (ctx, state) => Switch(
                  value: state is ToggleSwitchOnState,
                  activeColor: BASE_COLOR,
                  onChanged: (val) => toggleSwitchBloc.add(ToggleSwitchEvent()),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10),
        BlocBuilder<ToggleSwitchBloc, ToggleSwitchState>(builder: (ctx, state) {
          if (state is ToggleSwitchOnState)
            return Column(
              children: [
                RoundedTextField(
                  icon: Icons.attach_money_rounded,
                  controller: createTechniqueBloc.idController,
                  placeholderText: "Product ID",
                ),
                SizedBox(height: 10),
              ],
            );
          else
            return Container();
        }),
        FutureBuilder<List<Category>>(
          future: createTechniqueBloc.categories,
          builder: (ctx, snapshot) {
            late final items;

            if (snapshot.hasData) {
              items = snapshot.data!
                  .map(
                    (e) => DropdownMenuItem<String>(
                      child: Row(children: [
                        Text(e.getLocalizedTitle(l10n.locale.languageCode)),
                        SizedBox(width: 5),
                        e.isVisible ? visibleIcon : hiddenIcon,
                      ]),
                      value: e.id,
                    ),
                  )
                  .toList();
            } else {
              items = [DropdownMenuItem<String>(child: Text("Loading categories..."))];
            }

            return RoundedDropdown<String>(
              items: items,
              placeholderText: "Category",
              icon: Icons.folder_open_rounded,
              controller: createTechniqueBloc.categoryController,
            );
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
          controller: createTechniqueBloc.difficultyController,
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
                          arguments: UploadFilesScreenArgs(createTechniqueBloc.thumbnailController, createTechniqueBloc.videoController),
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
              BlocConsumer<CreateTechniqueBloc, CreateTechniqueState>(
                listener: (ctx, state) {
                  if (state is CreateTechniqueFinishedState) Navigator.pop(context);
                },
                builder: (ctx, state) => LanguageSideScrollGrid(
                  displayAddButton: SupportedLanguages.languages.length != createTechniqueBloc.localizedData.length,
                  data: createTechniqueBloc.languageSideScrollGridItems(ctx),
                  onAddButtonTap: () => Navigator.pushNamed(context, TECHNIQUE_LOCALIZATION_ADD_SCREEN_ROUTE, arguments: TechniqueLocalizationAddScreenArgs(createTechniqueBloc)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        RoundedButton(
          text: "Create",
          onPressed: () => createTechniqueBloc.add(CreateTechniqueFormSubmittedEvent(toggleSwitchBloc.state is ToggleSwitchOnState)),
        ),
      ],
    );
  }
}
