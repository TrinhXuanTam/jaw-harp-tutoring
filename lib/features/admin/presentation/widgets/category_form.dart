import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_edit_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/file_upload_field.dart';
import 'package:jews_harp/features/admin/presentation/widgets/language_side_scroll_grid.dart';
import 'package:jews_harp/features/admin/presentation/widgets/localization_field.dart';
import 'package:jews_harp/features/admin/presentation/widgets/toggle_switch_field.dart';

/// Category form.
class CategoryForm extends StatelessWidget {
  final String submitButtonText;
  final VoidCallback onSubmit;

  const CategoryForm({
    Key? key,
    this.submitButtonText = "Submit",
    required this.onSubmit,
  }) : super(key: key);

  List<LanguageSideScrollGridItem> _buildLanguageSideScrollGridItems(BuildContext context) {
    final categoryFormBloc = BlocProvider.of<CategoryFormBloc>(context);
    final localizedData = categoryFormBloc.state.localizedData;
    final List<LanguageSideScrollGridItem> languageScrollGridItems = [];

    localizedData.forEach((key, value) {
      languageScrollGridItems.add(LanguageSideScrollGridItem(
        languageCode: key,
        onTap: () => Navigator.pushNamed(
          context,
          CATEGORY_LOCALIZATION_EDIT_SCREEN_ROUTE,
          arguments: CategoryLocalizationEditScreenArgs(
            data: value,
            categoryFormBloc: categoryFormBloc,
          ),
        ),
      ));
    });

    return languageScrollGridItems;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<CategoryFormBloc, CategoryFormState>(
      builder: (context, state) {
        final bloc = BlocProvider.of<CategoryFormBloc>(context);

        return Container(
          width: size.width * 0.75,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ToggleSwitchField(
                title: "Visibility:",
                description: "The category and its content will be visible to the public if set.",
                value: state.isVisible,
                onChanged: (val) => bloc.add(UpdateCategoryVisibility(val)),
              ),
              const SizedBox(height: 10),
              FileUploadField(
                thumbnailController: state.thumbnailController,
              ),
              const SizedBox(height: 20),
              LocalizationField(
                displayAddButton: SupportedLanguages.languages.length != state.localizedData.length,
                data: _buildLanguageSideScrollGridItems(context),
                onAddButtonTap: () => Navigator.pushNamed(
                  context,
                  CATEGORY_LOCALIZATION_ADD_SCREEN_ROUTE,
                  arguments: CategoryLocalizationAddScreenArgs(categoryFormBloc: BlocProvider.of<CategoryFormBloc>(context)),
                ),
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
