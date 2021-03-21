import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/techniques/techniques_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/default_category_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

import 'lazy_load_techniques_wrapper.dart';

class CategoriesScreenBody extends StatelessWidget {
  final List<Category> categories;

  const CategoriesScreenBody({Key? key, required this.categories}) : super(key: key);

  Widget _buildDefaultCategory(BuildContext ctx, List<Category> categories) {
    final color = getRandomShade("All Techniques".hashCode);
    final l10n = AppLocalizations.of(ctx);

    return LazyLoadTechniquesWrapper(
      color: color,
      loadEvent: LoadAllTechniques(),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
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
      ),
      openBuilder: (TechniquesBloc bloc) => DefaultCategoryScreen(techniquesBloc: bloc),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CenteredStack(
      children: [
        Column(
          children: [
            Text(
              "Categories",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Scrollbar(
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: this.categories.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == 0)
                        return _buildDefaultCategory(context, categories);
                      else {
                        final category = this.categories[index - 1];
                        final color = category.getColor(context);
                        return LazyLoadTechniquesWrapper(
                          color: color,
                          loadEvent: LoadTechniquesByCategory(category),
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: color,
                              border: Border.all(color: Colors.grey[300]!),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${category.techniqueIds.length}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  category.title(context),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  category.description(context),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          openBuilder: (TechniquesBloc bloc) => CategoryScreen(category: category, techniquesBloc: bloc),
                        );
                      }
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
