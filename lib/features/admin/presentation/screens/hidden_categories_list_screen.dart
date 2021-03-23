import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/loading_wrapper.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/hidden_categories/hidden_categories_bloc.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_category_list.dart';

import 'category_detail_screen.dart';

class HiddenCategoriesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider<HiddenCategoriesBloc>(
      create: (_) => serviceLocator<HiddenCategoriesBloc>()..add(LoadHiddenCategories()),
      child: BlocBuilder<HiddenCategoriesBloc, HiddenCategoriesState>(
        builder: (ctx, state) {
          if (state is HiddenCategoriesLoaded)
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: IconAppBar(
                backgroundColor: BASE_COLOR,
                iconColor: Colors.white,
                onPressed: () => Navigator.pop(context),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hidden Categories",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Here you can browse through hidden categories and prepare new techniques for future release. Users are not able see these categories and their content.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 15),
                        ScrollableCategoryList(
                          height: size.height * 0.7,
                          items: state.categories
                              .map(
                                (category) => ScrollableCategoryListItem(
                                  () => Navigator.pushReplacementNamed(
                                    context,
                                    CATEGORY_DETAIL_SCREEN_ROUTE,
                                    arguments: CategoryDetailScreenArgs(category),
                                  ),
                                  category.techniqueIds.length,
                                  category.title,
                                  category.description,
                                ),
                              )
                              .toList(),
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
