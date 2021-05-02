import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_localization_form.dart';

class CategoryLocalizationAddScreenArgs {
  final CategoryFormBloc categoryFormBloc;

  CategoryLocalizationAddScreenArgs({required this.categoryFormBloc});
}

/// Add new category localization data form.
class CategoryLocalizationAddScreen extends StatelessWidget {
  final CategoryFormBloc categoryFormBloc;

  factory CategoryLocalizationAddScreen.fromArgs(CategoryLocalizationAddScreenArgs args) {
    return CategoryLocalizationAddScreen(categoryFormBloc: args.categoryFormBloc);
  }

  const CategoryLocalizationAddScreen({
    Key? key,
    required this.categoryFormBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const TitleWithSubtitle(
                    titleText: "Add Localization",
                    titleSize: 30,
                    subtitleText: "Add localized data to your category",
                  ),
                  const SizedBox(height: 20),
                  CategoryLocalizationForm(
                    bloc: this.categoryFormBloc,
                    submitButtonText: "Add",
                    onSubmit: (newData) {
                      this.categoryFormBloc.add(UpdateCategoryLocalization(newData));
                      Navigator.pop(context);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
