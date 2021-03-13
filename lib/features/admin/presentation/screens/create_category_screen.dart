import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/category_form.dart';

import 'category_detail_screen.dart';

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
                child: _CreateCategoryForm(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CreateCategoryForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CategoryForm(
      submitButtonText: "Create",
      onSubmit: () => BlocProvider.of<CategoryFormBloc>(context).add(CreateCategoryEvent()),
      onSuccess: (category) => Navigator.pushReplacementNamed(
        context,
        CATEGORY_DETAIL_SCREEN_ROUTE,
        arguments: CategoryDetailScreenArgs(
          serviceLocator<CategoryDetailBloc>(param1: category),
        ),
      ),
    );
  }
}
