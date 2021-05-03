import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_transition_wrapper.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:optional/optional.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techniqueIds;
  final Optional<Media> thumbnail;
  final double? width;

  factory CategoryCard.fromCategory({required Category category, double? width}) {
    return CategoryCard(
      title: category.title,
      description: category.description,
      thumbnail: category.thumbnail,
      techniqueIds: category.techniqueIds,
    );
  }

  const CategoryCard({
    Key? key,
    required this.title,
    required this.description,
    required this.techniqueIds,
    this.thumbnail = const Optional.empty(),
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryColor = getRandomShade(this.title.hashCode);

    return Container(
      height: 130,
      width: 100,
      child: CategoryTransitionWrapper(
        color: categoryColor,
        src: Stack(
          children: [
            if (thumbnail.isPresent)
              ClipRRect(
                borderRadius: BorderRadius.circular(19),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: FittedBox(fit: BoxFit.cover, child: getImageFromMedia(thumbnail.value)),
                ),
              ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(19),
                color: thumbnail.isPresent ? categoryColor.withOpacity(0.8) : categoryColor,
              ),
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${this.techniqueIds.length}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    this.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        dst: CategoryScreen(
          title: this.title,
          description: this.description,
          techniqueIds: this.techniqueIds,
          thumbnail: this.thumbnail,
        ),
      ),
    );
  }
}

class CategoryCardLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: Colors.grey[300]!,
      ),
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(15),
    );
  }
}
