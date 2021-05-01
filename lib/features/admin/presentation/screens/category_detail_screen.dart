import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/extensions.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_detail/category_detail_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/edit_technique_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/edit_category_button.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_technique_list.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';

class CategoryDetailScreenArgs {
  final Category category;

  CategoryDetailScreenArgs(this.category);
}

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
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: IconAppBar(
                backgroundColor: BASE_COLOR,
                iconColor: Colors.white,
                onPressed: () {
                  if (this.category.isVisible)
                    Navigator.pushReplacementNamed(context, VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE);
                  else
                    Navigator.pushReplacementNamed(context, HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE);
                },
              ),
              backgroundColor: Colors.grey[200],
              body: CenteredStack(
                children: [
                  Positioned(
                    top: 0,
                    child: BigAppBarBackground(height: size.height * 0.2),
                  ),
                  Container(
                    width: size.width * 0.9,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.category.title,
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    state.category.description,
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30),
                            EditCategoryButton(category: category),
                          ],
                        ),
                        SizedBox(height: 15),
                        ScrollableTechniqueList(
                          items: state.techniques,
                          onTap: (technique) => Navigator.pushReplacementNamed(
                            context,
                            EDIT_TECHNIQUE_SCREEN_ROUTE,
                            arguments: EditTechniqueScreenArgs(
                              technique,
                              (ctx) => Navigator.pushReplacementNamed(
                                ctx,
                                CATEGORY_DETAIL_SCREEN_ROUTE,
                                arguments: CategoryDetailScreenArgs(this.category),
                              ),
                            ),
                          ),
                          height: size.height * 0.7,
                        ),
                      ],
                    ),
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
