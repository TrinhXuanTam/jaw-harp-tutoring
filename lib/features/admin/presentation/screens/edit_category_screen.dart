import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_form.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';

class EditCategoryScreenArgs {
  final Category category;
  final void Function(BuildContext ctx, Category category) onClose;

  EditCategoryScreenArgs(this.category, this.onClose);
}

class EditCategoryScreen extends StatelessWidget {
  final Category category;
  final void Function(BuildContext ctx, Category category) onClose;

  factory EditCategoryScreen.fromArgs(EditCategoryScreenArgs args) {
    return EditCategoryScreen(
      category: args.category,
      onClose: args.onClose,
    );
  }

  const EditCategoryScreen({
    Key? key,
    required this.category,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => this.onClose(context, this.category),
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
                  isVisible: this.category.isVisible,
                  localizedData: this.category.localizedData,
                )),
                child: _EditCategoryForm(
                  category: this.category,
                  onClose: (category) => this.onClose(context, category),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EditCategoryForm extends StatelessWidget {
  final Category category;
  final void Function(Category category) onClose;

  const _EditCategoryForm({
    Key? key,
    required this.category,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryForm(
          submitButtonText: "Save",
          onSubmit: () => BlocProvider.of<CategoryFormBloc>(context).add(UpdateCategoryEvent(this.category)),
          onSuccess: (updatedCategory) => this.onClose(updatedCategory),
        ),
        SizedBox(height: 5),
        RoundedButton(
          text: "Remove",
          color: Colors.redAccent[200]!,
          textColor: Colors.white,
          borderColor: Colors.redAccent[200]!,
          onPressed: () {
            this.onClose(this.category);
          },
        ),
      ],
    );
  }
}
