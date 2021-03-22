import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class BigTechniqueList extends StatelessWidget {
  final List<Technique> techniques;
  final bool showCategory;
  final bool isLoading;

  const BigTechniqueList({
    Key? key,
    this.techniques = const [],
    this.showCategory = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    if (!isLoading)
      return ListView.builder(
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
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[200]!),
                  borderRadius: BorderRadius.circular(29),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Stack(
                        children: [
                          Container(
                            child: Container(
                              height: 150,
                              width: double.infinity,
                              child: thumbnail,
                            ),
                          ),
                          if (showCategory)
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(29)),
                                  color: Colors.white,
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                alignment: Alignment.center,
                                child: Text(
                                  item.category.getLocalizedTitle(l10n.locale.languageCode),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.getLocalizedTitle(l10n.locale.languageCode),
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.timelapse_rounded,
                                      color: BASE_COLOR,
                                      size: 15,
                                    ),
                                    SizedBox(width: 4),
                                    Text(item.difficulty.string),
                                    SizedBox(width: 20),
                                    Icon(
                                      Icons.attach_money_rounded,
                                      color: BASE_COLOR,
                                      size: 15,
                                    ),
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
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    else
      return _LoadingEffect();
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
              margin: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(29),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(29),
                        ),
                        height: 150,
                        width: double.infinity,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 19,
                                    width: 200,
                                    color: Colors.grey,
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.timelapse_rounded,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
                                      SizedBox(width: 4),
                                      Container(
                                        height: 16,
                                        width: 50,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 20),
                                      Icon(
                                        Icons.attach_money_rounded,
                                        color: Colors.grey,
                                        size: 15,
                                      ),
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
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
