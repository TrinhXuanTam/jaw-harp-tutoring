import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/admin_scaffold.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_category_list.dart';

import 'category_detail_screen.dart';

/// Screen that displays a list of hidden categories.
class HiddenCategoriesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider<HiddenCategoriesBloc>(
      create: (_) => serviceLocator<HiddenCategoriesBloc>()..add(LoadHiddenCategories()),
      child: BlocBuilder<HiddenCategoriesBloc, HiddenCategoriesState>(
        builder: (ctx, state) {
          if (state is HiddenCategoriesLoaded)
            return AdminScaffold(
              onClose: () => Navigator.pop(context),
              title: "Hidden Categories",
              description: "Here you can browse through hidden categories and prepare new techniques for future release. Users are not able see these categories and their content.",
              body: ScrollableCategoryList(
                height: size.height * 0.8,
                items: state.categories,
                onTap: (category) => Navigator.pushReplacementNamed(
                  context,
                  CATEGORY_DETAIL_SCREEN_ROUTE,
                  arguments: CategoryDetailScreenArgs(category),
                ),
              ),
            );
          else
            return LoadingScreen();
        },
      ),
    );
  }
}
