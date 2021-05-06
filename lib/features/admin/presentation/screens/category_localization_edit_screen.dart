import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_localization_form.dart';

class CategoryLocalizationEditScreenArgs {
  final CategoryLocalizedData data;
  final CategoryFormBloc categoryFormBloc;

  CategoryLocalizationEditScreenArgs({
    required this.data,
    required this.categoryFormBloc,
  });
}

/// Edit category localization data form.
class CategoryLocalizationEditScreen extends StatelessWidget {
  final CategoryLocalizedData data;
  final CategoryFormBloc categoryFormBloc;

  factory CategoryLocalizationEditScreen.fromArgs(CategoryLocalizationEditScreenArgs args) {
    return CategoryLocalizationEditScreen(
      data: args.data,
      categoryFormBloc: args.categoryFormBloc,
    );
  }

  const CategoryLocalizationEditScreen({
    Key? key,
    required this.data,
    required this.categoryFormBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          color: Colors.transparent,
          child: CenteredStack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TitleWithSubtitle(
                    titleText: "Edit Localization",
                    titleSize: 30,
                    subtitleText: l10n.translate("Edit localized data for") + " " + l10n.translate(SupportedLanguages.getName(this.data.languageCode)).toLowerCase(),
                  ),
                  const SizedBox(height: 20),
                  CategoryLocalizationForm(
                    data: this.data,
                    bloc: this.categoryFormBloc,
                    onSubmit: (newData) {
                      this.categoryFormBloc.add(UpdateCategoryLocalization(newData));
                      Navigator.pop(context);
                    },
                  ),
                  if (this.data.languageCode != ENGLISH_CODE)
                    Column(
                      children: [
                        const SizedBox(height: 5),
                        RoundedButton(
                          text: "Remove",
                          color: Colors.redAccent[200]!,
                          textColor: Colors.white,
                          borderColor: Colors.redAccent[200]!,
                          onPressed: () {
                            this.categoryFormBloc.add(RemoveCategoryLocalization(this.data.languageCode));
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
