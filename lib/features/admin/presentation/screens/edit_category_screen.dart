import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_localization/category_localization_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_form.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
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
    return BlocProvider<CategoryLocalizationBloc>(
      create: (_) => serviceLocator<CategoryLocalizationBloc>()..add(LoadCategoryLocalizedData(this.category)),
      child: BlocBuilder<CategoryLocalizationBloc, CategoryLocalizationState>(
        builder: (ctx, state) {
          if (state is CategoryLocalizationLoaded)
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
                          thumbnailController: ThumbnailPickerController(image: this.category.thumbnail.toNullable()),
                          localizedData: state.localizedData,
                        )),
                        child: Builder(
                          builder: (ctx) => CategoryForm(
                            submitButtonText: "Save",
                            onSubmit: () => BlocProvider.of<CategoryFormBloc>(ctx).add(UpdateCategoryEvent(this.category)),
                            onSuccess: (updatedCategory) => this.onClose(ctx, updatedCategory),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          else
            return LoadingScreen();
        },
      ),
    );
  }
}
