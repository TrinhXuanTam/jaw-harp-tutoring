import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/default_category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_transition_wrapper.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:optional/optional.dart';

class CategoriesScreenBody extends StatelessWidget {
  final List<Category> categories;

  const CategoriesScreenBody({Key? key, required this.categories}) : super(key: key);

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
                        return _CategoryCard(
                          color: getRandomShade("All Techniques".hashCode),
                          techniquesCnt: this.categories.fold<int>(0, (acc, element) => acc + element.techniqueIds.length),
                          title: "All Techniques",
                          description: "View all techniques",
                          dst: DefaultCategoryScreen(),
                        );
                      else {
                        final category = this.categories[index - 1];
                        final color = category.getColor(context);
                        return _CategoryCard(
                          color: color,
                          techniquesCnt: category.techniqueIds.length,
                          thumbnail: category.thumbnail,
                          title: category.title,
                          description: category.description,
                          dst: CategoryScreen(category: category),
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

class _CategoryCard extends StatelessWidget {
  final Color color;
  final int techniquesCnt;
  final Optional<Media> thumbnail;
  final String title;
  final String description;
  final Widget dst;

  const _CategoryCard({
    Key? key,
    required this.color,
    required this.techniquesCnt,
    this.thumbnail = const Optional.empty(),
    required this.title,
    required this.description,
    required this.dst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: CategoryTransitionWrapper(
        color: this.color,
        src: Stack(
          children: [
            if (thumbnail.isPresent)
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(fit: BoxFit.cover, child: getImageFromMedia(thumbnail.value)),
                ),
              ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: thumbnail.isPresent ? this.color.withOpacity(0.8) : this.color,
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${this.techniquesCnt}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    this.description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        dst: this.dst,
      ),
    );
  }
}
