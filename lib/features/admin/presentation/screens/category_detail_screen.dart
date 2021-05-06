import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/admin_scaffold.dart';
import 'package:jews_harp/features/admin/presentation/widgets/edit_category_button.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_technique_list.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';

class CategoryDetailScreenArgs {
  final Category category;
  CategoryDetailScreenArgs(this.category);
}

/// Category detail screen.
class CategoryDetailScreen extends StatelessWidget {
  final Category category;

  factory CategoryDetailScreen.fromArgs(CategoryDetailScreenArgs args) {
    return CategoryDetailScreen(category: args.category);
  }

  const CategoryDetailScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider<CategoryDetailBloc>(
      create: (_) => serviceLocator<CategoryDetailBloc>()..add(LoadTechniques(this.category)),
      child: BlocBuilder<CategoryDetailBloc, CategoryDetailState>(
        buildWhen: (prevState, newState) => prevState is CategoryDetailLoading,
        builder: (ctx, state) {
          if (state is CategoryDetailLoaded)
            return AdminScaffold(
              onClose: () {
                if (this.category.isVisible)
                  Navigator.pushReplacementNamed(context, VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE);
                else
                  Navigator.pushReplacementNamed(context, HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE);
              },
              title: state.category.title,
              description: state.category.description,
              actions: [
                const SizedBox(width: 30),
                EditCategoryButton(category: category),
              ],
              body: ScrollableTechniqueList(
                items: state.techniques,
                onTap: (technique) => Navigator.pushReplacementNamed(
                  context,
                  EDIT_TECHNIQUE_SCREEN_ROUTE,
                  arguments: EditTechniqueScreenArgs(
                    technique,
                    (ctx) => Navigator.pushReplacementNamed(ctx, CATEGORY_DETAIL_SCREEN_ROUTE, arguments: CategoryDetailScreenArgs(this.category)),
                  ),
                ),
                height: size.height * 0.7,
              ),
            );
          else
            return const LoadingScreen();
        },
      ),
    );
  }
}
