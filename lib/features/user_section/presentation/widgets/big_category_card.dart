import 'package:flutter/material.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/presentation/screens/category_screen.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/category_transition_wrapper.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:optional/optional.dart';

/// Big category card button.
class BigCategoryCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> techniqueIds;
  final Optional<Media> thumbnail;

  factory BigCategoryCard.fromCategory({required Category category}) {
    return BigCategoryCard(
      title: category.title,
      description: category.description,
      thumbnail: category.thumbnail,
      techniqueIds: category.techniqueIds,
    );
  }

  const BigCategoryCard({
    Key? key,
    required this.title,
    required this.description,
    required this.techniqueIds,
    this.thumbnail = const Optional.empty(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryColor = getRandomShade(this.title.hashCode);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: IntrinsicHeight(
        child: CategoryTransitionWrapper(
          color: categoryColor,
          src: Stack(
            children: [
              if (this.thumbnail.isPresent)
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: getImageFromMedia(this.thumbnail.value),
                    ),
                  ),
                ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: thumbnail.isPresent ? categoryColor.withOpacity(0.8) : categoryColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${this.techniqueIds.length}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      this.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      this.description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
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
      ),
    );
  }
}
