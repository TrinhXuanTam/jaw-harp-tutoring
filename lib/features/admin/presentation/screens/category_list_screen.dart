import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/screens/category_detail_screen.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_category_list.dart';
import 'package:jews_harp/features/techniques/domain/entities/category.dart';

class CategoryListScreenArgs {
  final String title;
  final String subtitle;
  final List<Category> items;

  CategoryListScreenArgs({
    required this.title,
    required this.subtitle,
    required this.items,
  });
}

class CategoryListScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<Category> items;

  factory CategoryListScreen.fromArgs(CategoryListScreenArgs args) {
    return CategoryListScreen(
      title: args.title,
      subtitle: args.subtitle,
      items: args.items,
    );
  }

  const CategoryListScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

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
                  this.title,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  this.subtitle,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                ScrollableCategoryList(
                  height: size.height * 0.7,
                  items: items
                      .map(
                        (category) => ScrollableCategoryListItem(
                          () => Navigator.pushNamed(
                            context,
                            CATEGORY_DETAIL_SCREEN_ROUTE,
                            arguments: CategoryDetailScreenArgs(category),
                          ),
                          category.techniqueIds.length,
                          category.getLocalizedTitle(l10n.locale.languageCode),
                          category.getLocalizedDescription(l10n.locale.languageCode),
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
  }
}
