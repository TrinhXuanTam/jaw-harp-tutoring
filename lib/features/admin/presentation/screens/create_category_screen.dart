import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_form.dart';


class CreateCategoryScreen extends StatelessWidget {
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
                titleText: "Create Category",
                titleSize: 35,
                subtitleText: "Create a new category to group techniques",
              ),
              SizedBox(height: 20),
              BlocProvider<CategoryFormBloc>(
                create: (ctx) => serviceLocator<CategoryFormBloc>(),
                child: Builder(
                  builder: (ctx) => CategoryForm(
                    submitButtonText: "Create",
                    onSubmit: () => BlocProvider.of<CategoryFormBloc>(ctx).add(CreateCategoryEvent()),
                    onSuccess: (_) => Navigator.pop(ctx),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
