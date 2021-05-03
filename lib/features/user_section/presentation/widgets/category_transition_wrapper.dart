import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

/// Category transition effect.
class CategoryTransitionWrapper extends StatelessWidget {
  final Color color;
  final Widget src;
  final Widget dst;

  const CategoryTransitionWrapper({
    Key? key,
    required this.color,
    required this.src,
    required this.dst,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedElevation: 0,
      openElevation: 0,
      openColor: color,
      middleColor: color,
      transitionType: ContainerTransitionType.fadeThrough,
      openBuilder: (ctx, _) => dst,
      closedBuilder: (ctx, openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: src,
        );
      },
    );
  }
}
