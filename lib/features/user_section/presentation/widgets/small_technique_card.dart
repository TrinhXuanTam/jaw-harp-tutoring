import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/presentation/screens/unlock_technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class SmallTechniqueCard extends StatelessWidget {
  final String techniqueId;
  final double? width;

  factory SmallTechniqueCard.fromTechnique({required Technique technique, double? width}) => SmallTechniqueCard(techniqueId: technique.id, width: width);

  const SmallTechniqueCard({
    Key? key,
    required this.techniqueId,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TechniqueBloc>(
      create: (_) => serviceLocator<TechniqueBloc>()..add(LoadTechnique(this.techniqueId)),
      child: BlocBuilder<TechniqueBloc, TechniqueState>(builder: (ctx, state) {
        if (state is TechniqueLoaded) {
          final technique = state.technique;

          return OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (ctx, _) => TechniqueScreen(
              technique: technique,
              hasAccess: hasAccessToTechnique(context, technique),
            ),
            closedBuilder: (ctx, openContainer) => GestureDetector(
              onTap: openContainer,
              child: Container(
                width: this.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: getTechniqueThumbnail(technique),
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      technique.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      technique.category.title,
                      overflow: TextOverflow.ellipsis,
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
                            Text(
                              getPriceTag(context, technique),
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
        } else
          return SmallTechniqueCardLoading(width: width);
      }),
    );
  }
}

class SmallTechniqueCardLoading extends StatelessWidget {
  final double? width;

  const SmallTechniqueCardLoading({Key? key, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: Container(
        width: this.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey,
                ),
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
    );
  }
}
