import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
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

/// Category form with preloaded data.
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
        builder: (_, state) {
          if (state is CategoryLocalizationLoaded)
            return BlocProvider(
              create: (_) => serviceLocator<CategoryFormBloc>(
                param1: CategoryFormState(
                  isVisible: this.category.isVisible,
                  thumbnailController: ThumbnailPickerController(image: this.category.thumbnail.toNullable()),
                  localizedData: state.localizedData,
                ),
              ),
              child: BlocConsumer<CategoryFormBloc, CategoryFormState>(
                listener: (ctx, state) {
                  // Close form when successfully submitted.
                  if (state.success != null) this.onClose(ctx, state.success!);
                },
                builder: (ctx, state) {
                  // Display loading screen on form submission.
                  if (state.formSubmitted) return const LoadingScreen(showCloseButton: false);

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
                            const TitleWithSubtitle(
                              titleText: "Edit Category",
                              titleSize: 35,
                              subtitleText: "Edit details of your category.",
                            ),
                            const SizedBox(height: 20),
                            CategoryForm(
                              submitButtonText: "Save",
                              onSubmit: () => BlocProvider.of<CategoryFormBloc>(ctx).add(UpdateCategoryEvent(this.category)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          else
            return const LoadingScreen();
        },
      ),
    );
  }
}
