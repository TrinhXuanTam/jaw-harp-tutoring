import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_dropdown.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/technique_form/technique_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/technique_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/upload_files_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique.dart';

class TechniqueForm extends StatelessWidget {
  final String submitButtonText;
  final VoidCallback onSubmit;
  final void Function(Technique technique) onSuccess;

  const TechniqueForm({
    Key? key,
    this.submitButtonText = "Submit",
    required this.onSubmit,
    required this.onSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<TechniqueFormBloc>(context);
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);
    final visibleIcon = Icon(Icons.public, color: BASE_COLOR.withAlpha(100), size: 18);
    final hiddenIcon = Icon(Icons.public_off_rounded, color: Colors.grey, size: 18);

    return BlocListener<TechniqueFormBloc, TechniqueFormState>(
      listener: (ctx, state) {
        if (state.success != null) this.onSuccess(state.success!);
      },
      child: Column(
        children: [
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
                BlocBuilder<TechniqueFormBloc, TechniqueFormState>(
                  builder: (ctx, state) => Switch(
                    value: state.isPaid,
                    activeColor: BASE_COLOR,
                    onChanged: (val) => bloc.add(UpdateTechniquePricing(val)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          BlocBuilder<TechniqueFormBloc, TechniqueFormState>(builder: (ctx, state) {
            if (state.isPaid)
              return Column(
                children: [
                  RoundedTextField(
                    icon: Icons.attach_money_rounded,
                    controller: state.idController,
                    placeholderText: "Product ID",
                  ),
                  SizedBox(height: 10),
                ],
              );
            else
              return Container();
          }),
          FutureBuilder<List<Category>>(
            future: bloc.categories,
            builder: (ctx, snapshot) {
              late final items;
              late final controller;

              if (snapshot.hasData) {
                controller = bloc.state.categoryController;
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
                controller = DropdownButtonFormFieldController<String>();
                items = [DropdownMenuItem<String>(child: Text("Loading categories..."))];
              }

              return RoundedDropdown<String>(
                items: items,
                placeholderText: "Category",
                icon: Icons.folder_open_rounded,
                controller: controller,
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
            controller: bloc.state.difficultyController,
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
                            arguments: UploadFilesScreenArgs(bloc.state.thumbnailController, bloc.state.videoController),
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
                BlocBuilder<TechniqueFormBloc, TechniqueFormState>(
                  builder: (ctx, state) => LanguageSideScrollGrid(
                    displayAddButton: SupportedLanguages.languages.length != bloc.state.localizedData.length,
                    data: _buildLanguageSideScrollGridItems(ctx, bloc),
                    onAddButtonTap: () => Navigator.pushNamed(context, TECHNIQUE_LOCALIZATION_ADD_SCREEN_ROUTE, arguments: TechniqueLocalizationAddScreenArgs(bloc)),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RoundedButton(
            text: "Create",
            onPressed: this.onSubmit,
          ),
        ],
      ),
    );
  }

  List<LanguageSideScrollGridItem> _buildLanguageSideScrollGridItems(BuildContext ctx, TechniqueFormBloc bloc) {
    return bloc.state.localizedData.entries
        .map(
          (entry) => LanguageSideScrollGridItem(
            languageCode: entry.key,
            onTap: () => Navigator.pushNamed(
              ctx,
              TECHNIQUE_LOCALIZATION_EDIT_SCREEN_ROUTE,
              arguments: TechniqueLocalizationEditScreenArgs(
                data: entry.value,
                onSave: (localizedData) {
                  bloc.add(UpdateTechniqueLocalization(localizedData));
                  Navigator.pop(ctx);
                },
                onRemove: () {
                  bloc.add(RemoveTechniqueLocalization(entry.key));
                  Navigator.pop(ctx);
                },
              ),
            ),
          ),
        )
        .toList();
  }
}
