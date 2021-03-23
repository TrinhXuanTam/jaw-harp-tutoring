import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class SmallTechniqueCard extends StatelessWidget {
  final Technique technique;
  final double width;

  const SmallTechniqueCard({
    Key? key,
    required this.technique,
    required this.width,
  }) : super(key: key);

  Widget _getThumbnail() {
    if (this.technique.thumbnail.isPresent)
      return FittedBox(
        fit: BoxFit.cover,
        child: getImageFromMedia(technique.thumbnail.value),
      );
    else
      return Container(
        padding: const EdgeInsets.all(20),
        color: BASE_COLOR,
        child: FittedBox(
          fit: BoxFit.contain,
          child: Image.asset(LOGO_LOCATION),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (ctx, _) => TechniqueScreen(technique: technique),
      closedBuilder: (ctx, openContainer) => GestureDetector(
        onTap: openContainer,
        child: Container(
          width: this.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: _getThumbnail(),
                ),
              ),
              SizedBox(height: 3),
              Text(
                technique.title,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                technique.category.title,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money_rounded,
                        color: BASE_COLOR,
                        size: 12,
                      ),
                      // TODO
                      Text(
                        technique.productId.isPresent ? "99.99\$" : "Free",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_rounded,
                        color: BASE_COLOR,
                        size: 12,
                      ),
                      SizedBox(width: 2),
                      Text(
                        technique.difficulty.string,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SmallTechniqueCardLoading extends StatelessWidget {
  final double width;

  const SmallTechniqueCardLoading({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.filled(
          3,
          ShimmerEffect(
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
              width: this.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 13,
                    width: 100,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 13,
                    width: 50,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.attach_money_rounded,
                            color: BASE_COLOR,
                            size: 12,
                          ),
                          Container(
                            height: 10,
                            width: 50,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.timelapse_rounded,
                            color: BASE_COLOR,
                            size: 12,
                          ),
                          SizedBox(width: 2),
                          Container(
                            height: 10,
                            width: 50,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
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
