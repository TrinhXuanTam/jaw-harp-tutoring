import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/visible_categories/visible_categories_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/admin_scaffold.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_category_list.dart';

import 'category_detail_screen.dart';

/// Screen that displays a list of visible categories.
class VisibleCategoriesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider<VisibleCategoriesBloc>(
      create: (_) => serviceLocator<VisibleCategoriesBloc>()..add(LoadVisibleCategories()),
      child: BlocBuilder<VisibleCategoriesBloc, VisibleCategoriesState>(
        builder: (ctx, state) {
          if (state is VisibleCategoriesLoaded)
            return AdminScaffold(
              onClose: () => Navigator.pop(context),
              title: "Visible Categories",
              description: "Here you can browse through visible categories. Users can see these categories and their content in their app.",
              body: ScrollableCategoryList(
                height: size.height * 0.7,
                items: state.categories,
                onTap: (category) => Navigator.pushReplacementNamed(
                  context,
                  CATEGORY_DETAIL_SCREEN_ROUTE,
                  arguments: CategoryDetailScreenArgs(category),
                ),
              ),
            );
          else
            return const LoadingScreen();
        },
      ),
    );
  }
}
