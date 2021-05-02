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
import 'package:jews_harp/features/admin/presentation/widgets/file_upload_field.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/admin/presentation/widgets/localization_field.dart';
import 'package:jews_harp/features/admin/presentation/widgets/toggle_switch_field.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';

/// Technique form.
class TechniqueForm extends StatelessWidget {
  final String submitButtonText;
  final VoidCallback onSubmit;

  const TechniqueForm({
    Key? key,
    this.submitButtonText = "Submit",
    required this.onSubmit,
  }) : super(key: key);

  Widget _buildCategoryField(BuildContext context) {
    final techniqueFormBloc = BlocProvider.of<TechniqueFormBloc>(context);
    final visibleIcon = Icon(Icons.public, color: BASE_COLOR.withAlpha(100), size: 18);
    final hiddenIcon = const Icon(Icons.public_off_rounded, color: Colors.grey, size: 18);

    /// Build category picker.
    return FutureBuilder<List<Category>>(
      future: techniqueFormBloc.categories,
      builder: (ctx, snapshot) {
        var items = [DropdownMenuItem<String>(child: Text("Loading categories..."))];
        var controller = DropdownButtonFormFieldController<String>();

        if (snapshot.hasData) {
          controller = techniqueFormBloc.state.categoryController;
          final categories = snapshot.data!;
          items.clear();

          categories.forEach((category) {
            items.add(
              DropdownMenuItem<String>(
                child: Row(children: [
                  Text(category.title),
                  SizedBox(width: 5),
                  category.isVisible ? visibleIcon : hiddenIcon,
                ]),
                value: category.id,
              ),
            );
          });
        }

        return RoundedDropdown<String>(
          items: items,
          placeholderText: "Category",
          icon: Icons.folder_open_rounded,
          controller: controller,
        );
      },
    );
  }

  /// Build difficulty picker.
  Widget _buildDifficultyField(BuildContext context) {
    final techniqueFormBloc = BlocProvider.of<TechniqueFormBloc>(context);
    final List<DropdownMenuItem<TechniqueDifficulty>> items = [];

    TechniqueDifficulty.values.forEach((difficulty) {
      items.add(
        DropdownMenuItem<TechniqueDifficulty>(
          value: difficulty,
          child: Text(difficulty.string),
        ),
      );
    });

    return RoundedDropdown<TechniqueDifficulty>(
      items: items,
      placeholderText: "Difficulty",
      icon: Icons.timelapse_rounded,
      controller: techniqueFormBloc.state.difficultyController,
    );
  }

  List<LanguageSideScrollGridItem> _buildLanguageSideScrollGridItems(BuildContext context) {
    final techniqueFormBloc = BlocProvider.of<TechniqueFormBloc>(context);
    final localizedData = techniqueFormBloc.state.localizedData;
    final List<LanguageSideScrollGridItem> languageScrollGridItems = [];

    localizedData.forEach((key, value) {
      languageScrollGridItems.add(LanguageSideScrollGridItem(
        languageCode: key,
        onTap: () => Navigator.pushNamed(
          context,
          TECHNIQUE_LOCALIZATION_EDIT_SCREEN_ROUTE,
          arguments: TechniqueLocalizationEditScreenArgs(
            data: value,
            techniqueFormBloc: techniqueFormBloc,
          ),
        ),
      ));
    });

    return languageScrollGridItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<TechniqueFormBloc, TechniqueFormState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<TechniqueFormBloc>(context);

        return Container(
          width: size.width * 0.75,
          child: Column(
            children: [
              ToggleSwitchField(
                title: "Paid:",
                description: "User has to pay for access to this technique.",
                value: state.isPaid,
                onChanged: (val) => bloc.add(UpdateTechniquePricing(val)),
              ),
              SizedBox(height: 10),
              if (state.isPaid)
                Column(
                  children: [
                    RoundedTextField(
                      icon: Icons.attach_money_rounded,
                      controller: state.idController,
                      placeholderText: "Product ID",
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              _buildCategoryField(context),
              const SizedBox(height: 10),
              _buildDifficultyField(context),
              const SizedBox(height: 15),
              FileUploadField(
                thumbnailController: state.thumbnailController,
                videoController: state.videoController,
              ),
              const SizedBox(height: 15),
              LocalizationField(
                displayAddButton: SupportedLanguages.languages.length != state.localizedData.length,
                onAddButtonTap: () => Navigator.pushNamed(
                  context,
                  TECHNIQUE_LOCALIZATION_ADD_SCREEN_ROUTE,
                  arguments: TechniqueLocalizationAddScreenArgs(bloc),
                ),
                data: _buildLanguageSideScrollGridItems(context),
              ),
              const SizedBox(height: 10),
              RoundedButton(
                text: this.submitButtonText,
                onPressed: this.onSubmit,
              ),
            ],
          ),
        );
      },
    );
  }
}
