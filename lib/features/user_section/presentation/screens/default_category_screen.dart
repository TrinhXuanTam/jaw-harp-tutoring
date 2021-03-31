import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class DefaultCategoryScreen extends StatelessWidget {
  final List<Category> categories;

  const DefaultCategoryScreen({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final techniqueIds = categories.map((category) => category.techniqueIds).expand((e) => e).toList();

    return Scaffold(
      appBar: IconAppBar(
        title: "All Techniques",
        titleColor: Colors.white,
        iconColor: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      backgroundColor: getRandomShade("All Techniques".hashCode),
      body: CenteredStack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Container(
                        color: getRandomShade("All Techniques".hashCode),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                "All Techniques",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                "View all techniques",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: techniqueIds.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: SmallTechniqueCard(techniqueId: techniqueIds[index]),
                        );
                      },
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
