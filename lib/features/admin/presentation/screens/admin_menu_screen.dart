import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/bordered_list.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/admin_menu/admin_menu_bloc.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/category_form/category_form_bloc.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_list_screen.dart';

class AdminMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                  "Admin Menu",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Here you can manage techniques and categories to offer your customers new content.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                BlocProvider<AdminMenuBloc>(
                  create: (_) => serviceLocator<AdminMenuBloc>(),
                  child: _AdminOptions(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AdminOptions extends StatelessWidget {
  void _adminMenuBlocListener(BuildContext ctx, AdminMenuState state) {
    if (state is VisibleCategoriesLoadedState)
      Navigator.of(ctx).pushNamed(
        VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE,
        arguments: CategoryListScreenArgs(
          title: "Visible Categories",
          subtitle: "Here you can browse through visible categories. Users can see these categories and their content in their app.",
          items: state.visibleCategories,
        ),
      );
    else if (state is HiddenCategoriesLoadedState)
      Navigator.of(ctx).pushNamed(
        HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE,
        arguments: CategoryListScreenArgs(
          title: "Hidden Categories",
          subtitle: "Here you can browse through hidden categories and prepare new techniques for future release. Users are not able see these categories and their content.",
          items: state.hiddenCategories,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AdminMenuBloc, AdminMenuState>(
      listener: _adminMenuBlocListener,
      child: Column(
        children: [
          BorderedList(
            items: [
              BorderedListItem(
                onTap: () => Navigator.pushNamed(context, CREATE_TECHNIQUE_SCREEN_ROUTE),
                icon: Icons.add,
                title: "Create Technique",
                description: "Create a new technique.",
              ),
              BorderedListItem(
                onTap: () {},
                icon: Icons.done,
                title: "Released Techniques",
                description: "Browse released techniques.",
              ),
              BorderedListItem(
                onTap: () {},
                icon: Icons.close_rounded,
                title: "Unreleased Techniques",
                description: "Techniques that ready to be released.",
              ),
            ],
          ),
          SizedBox(height: 5),
          BorderedList(
            items: [
              BorderedListItem(
                onTap: () => Navigator.pushNamed(context, CREATE_CATEGORY_SCREEN_ROUTE),
                icon: Icons.create_new_folder_outlined,
                title: "Create Category",
                description: "Create a new category to group techniques.",
              ),
              BorderedListItem(
                onTap: () => BlocProvider.of<AdminMenuBloc>(context).add(LoadVisibleCategoriesEvent()),
                icon: Icons.public,
                title: "Visible Categories",
                description: "Categories that are visible to the public.",
              ),
              BorderedListItem(
                onTap: () => BlocProvider.of<AdminMenuBloc>(context).add(LoadHiddenCategoriesEvent()),
                icon: Icons.public_off_rounded,
                title: "Hidden Categories",
                description: "Categories that are not visible to the public.",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
