import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class CategoriesScreenBody extends StatelessWidget {
  final List<Category> categories;

  const CategoriesScreenBody({Key? key, required this.categories}) : super(key: key);

  Widget _buildDefaultCategory(BuildContext ctx, List<Category> categories) {
    final l10n = AppLocalizations.of(ctx);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: getRandomShade("All Techniques".hashCode),
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${this.categories.fold<int>(0, (acc, element) => acc + element.techniqueIds.length)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 50,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            l10n.translate("All Techniques"),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            l10n.translate("View all techniques"),
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return CenteredStack(
      children: [
        Column(
          children: [
            TitleWithSubtitle(
              titleText: "Categories",
              subtitleText: "Filter techniques by category",
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Scrollbar(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: this.categories.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0)
                        return _buildDefaultCategory(context, categories);
                      else
                        return OpenContainer(
                          closedElevation: 0,
                          openElevation: 0,
                          openColor: this.categories[index - 1].getColor(context),
                          middleColor: this.categories[index - 1].getColor(context),
                          transitionType: ContainerTransitionType.fadeThrough,
                          openBuilder: (ctx, _) => CategoryScreen(category: this.categories[index - 1]),
                          closedBuilder: (ctx, openBuilder) => Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: this.categories[index - 1].getColor(context),
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${this.categories[index - 1].techniqueIds.length}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  this.categories[index - 1].getLocalizedTitle(l10n.locale.languageCode),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  this.categories[index - 1].getLocalizedDescription(l10n.locale.languageCode),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                    },
                    staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
