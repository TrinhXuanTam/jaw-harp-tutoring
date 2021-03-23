import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class TechniqueList extends StatelessWidget {
  final List<Technique> techniques;
  final bool showCategory;
  final bool isLoading;

  const TechniqueList({
    Key? key,
    this.techniques = const [],
    this.showCategory = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.isLoading)
      return _LoadingEffect();
    else
      return ListView.separated(
        itemCount: techniques.length,
        itemBuilder: (ctx, index) {
          final item = techniques[index];
          late Widget thumbnail;

          if (item.thumbnail.isPresent)
            thumbnail = FittedBox(
              fit: BoxFit.cover,
              child: getImageFromMedia(item.thumbnail.value),
            );
          else
            thumbnail = Container(
              padding: const EdgeInsets.all(20),
              color: BASE_COLOR,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Image.asset(
                  LOGO_LOCATION,
                  width: 30,
                ),
              ),
            );

          return OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (ctx, _) => TechniqueScreen(technique: item),
            closedBuilder: (ctx, openContainer) => GestureDetector(
              onTap: openContainer,
              child: Container(
                height: 140,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      child: Container(
                        child: Container(
                          width: 170,
                          height: double.infinity,
                          child: thumbnail,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            if (showCategory)
                              Text(
                                item.category.title,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.timelapse_rounded,
                                              color: BASE_COLOR,
                                              size: 15,
                                            ),
                                            SizedBox(width: 4),
                                            Text(item.difficulty.string),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.attach_money_rounded,
                                              color: BASE_COLOR,
                                              size: 15,
                                            ),
                                            SizedBox(width: 4),
                                            // TODO
                                            Text(item.productId.isPresent ? "99.99\$" : "Free"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.redAccent,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
      );
  }
}

class _LoadingEffect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.filled(
          3,
          ShimmerEffect(
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 140,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]!),
                borderRadius: BorderRadius.circular(20),
              ),
              width: double.infinity,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                    child: Container(
                      child: Container(
                        width: 170,
                        height: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                          ),
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 16,
                            width: 100,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 16,
                            width: 50,
                            color: Colors.grey,
                          ),
                          Expanded(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.timelapse_rounded,
                                            color: BASE_COLOR,
                                            size: 15,
                                          ),
                                          SizedBox(width: 4),
                                          Container(
                                            height: 16,
                                            width: 50,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.attach_money_rounded,
                                            color: BASE_COLOR,
                                            size: 15,
                                          ),
                                          SizedBox(width: 4),
                                          Container(
                                            height: 16,
                                            width: 50,
                                            color: Colors.grey,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.redAccent,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
