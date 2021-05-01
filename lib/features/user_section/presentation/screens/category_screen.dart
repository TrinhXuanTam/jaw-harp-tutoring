import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  Widget _buildThumbnail(BuildContext ctx) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: this
          .category
          .thumbnail
          .map<Widget>(
            (media) => FittedBox(
              fit: BoxFit.cover,
              child: getImageFromMedia(media),
            ),
          )
          .orElseGet(
            () => Container(
              color: this.category.getColor(),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryColor = this.category.getColor();

    return Scaffold(
      appBar: IconAppBar(
        backgroundColor: category.thumbnail.isPresent ? Colors.white : categoryColor,
        iconColor: category.thumbnail.isPresent ? Colors.black : Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    _buildThumbnail(context),
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
                                this.category.title,
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
                                this.category.description,
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
                      itemCount: this.category.techniqueIds.length,
                      itemBuilder: (BuildContext context, int index) => Container(
                        child: SmallTechniqueCard(techniqueId: this.category.techniqueIds[index]),
                      ),
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
