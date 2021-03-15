import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_form.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

import 'category_detail_screen.dart';

class EditCategoryScreenArgs {
  final Category category;

  EditCategoryScreenArgs(this.category);
}

class EditCategoryScreen extends StatelessWidget {
  final Category category;

  factory EditCategoryScreen.fromArgs(EditCategoryScreenArgs args) {
    return EditCategoryScreen(category: args.category);
  }

  const EditCategoryScreen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithSubtitle(
                titleText: "Edit Category",
                titleSize: 35,
                subtitleText: "Edit details of your category.",
              ),
              SizedBox(height: 20),
              BlocProvider<CategoryFormBloc>(
                create: (ctx) => serviceLocator<CategoryFormBloc>(
                    param1: CategoryFormState(
                  isVisible: category.isVisible,
                  localizedData: category.localizedData,
                )),
                child: _CreateCategoryForm(category: category),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreateCategoryForm extends StatelessWidget {
  final Category category;

  const _CreateCategoryForm({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryForm(
          submitButtonText: "Save",
          onSubmit: () => BlocProvider.of<CategoryFormBloc>(context).add(UpdateCategoryEvent(category)),
          onSuccess: (category) => Navigator.pushNamedAndRemoveUntil(
            context,
            CATEGORY_DETAIL_SCREEN_ROUTE,
            ModalRoute.withName(ADMIN_MENU_SCREEN_ROUTE),
            arguments: CategoryDetailScreenArgs(category),
          ),
        ),
        SizedBox(height: 5),
        RoundedButton(
          text: "Remove",
          color: Colors.redAccent[200]!,
          textColor: Colors.white,
          borderColor: Colors.redAccent[200]!,
          onPressed: () {},
        ),
      ],
    );
  }
}
