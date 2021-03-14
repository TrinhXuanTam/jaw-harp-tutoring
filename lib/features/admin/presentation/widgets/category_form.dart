import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_add_screen.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_localization_edit_screen.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

import 'language_side_scroll_grid.dart';

class CategoryForm extends StatelessWidget {
  final String submitButtonText;
  final VoidCallback onSubmit;
  final void Function(Category category) onSuccess;

  const CategoryForm({
    Key? key,
    this.submitButtonText = "Submit",
    required this.onSubmit,
    required this.onSuccess,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    final bloc = BlocProvider.of<CategoryFormBloc>(context);
    final size = MediaQuery.of(context).size;

    return BlocListener<CategoryFormBloc, CategoryFormState>(
      listener: (ctx, state) {
        if (state.success != null) onSuccess(state.success!);
      },
      child: Column(
        children: [
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
                            "Visibility:",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          Text(
                            "The category and its content will be visible to the public if set.",
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
                    BlocBuilder<CategoryFormBloc, CategoryFormState>(
                      builder: (ctx, state) => Switch(
                        value: state.isVisible,
                        activeColor: BASE_COLOR,
                        onChanged: (val) => bloc.add(UpdateCategoryVisibility(val)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
                SizedBox(height: 5),
                BlocBuilder<CategoryFormBloc, CategoryFormState>(
                  builder: (ctx, state) => LanguageSideScrollGrid(
                    displayAddButton: SupportedLanguages.languages.length != bloc.state.localizedData.length,
                    data: _buildLanguageSideScrollGridItems(ctx, bloc),
                    onAddButtonTap: () => Navigator.pushNamed(
                      context,
                      CATEGORY_LOCALIZATION_ADD_SCREEN_ROUTE,
                      arguments: CategoryLocalizationAddScreenArgs(categoryFormBloc: bloc),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          RoundedButton(
            text: this.submitButtonText,
            onPressed: this.onSubmit,
          ),
        ],
      ),
    );
  }

  List<LanguageSideScrollGridItem> _buildLanguageSideScrollGridItems(BuildContext ctx, CategoryFormBloc bloc) {
    return bloc.state.localizedData.entries
        .map(
          (e) => LanguageSideScrollGridItem(
            languageCode: e.key,
            onTap: () => Navigator.pushNamed(
              ctx,
              CATEGORY_LOCALIZATION_EDIT_SCREEN_ROUTE,
              arguments: CategoryLocalizationEditScreenArgs(
                data: e.value,
                onSave: (localizedData) => bloc.add(UpdateCategoryLocalization(localizedData)),
                onRemove: () => bloc.add(RemoveCategoryLocalization(e.key)),
              ),
            ),
          ),
        )
        .toList();
  }
}
