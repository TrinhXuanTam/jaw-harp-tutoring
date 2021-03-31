import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class TechniqueList extends StatelessWidget {
  final List<String> techniqueIds;
  final bool showFavoriteIcon;

  const TechniqueList({Key? key, required this.techniqueIds, this.showFavoriteIcon = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = getUser(context);

    return ListView.separated(
      itemCount: techniqueIds.length,
      itemBuilder: (ctx, index) {
        return BlocProvider<TechniqueBloc>(
          create: (_) => serviceLocator<TechniqueBloc>()..add(LoadTechnique(techniqueIds[index])),
          child: BlocBuilder<TechniqueBloc, TechniqueState>(
            builder: (ctx, state) {
              if (state is TechniqueLoaded) {
                final technique = state.technique;

                return OpenContainer(
                  openElevation: 0,
                  closedElevation: 0,
                  transitionType: ContainerTransitionType.fadeThrough,
                  openBuilder: (ctx, _) => TechniqueScreen(technique: technique),
                  closedBuilder: (ctx, openContainer) => GestureDetector(
                    onTap: openContainer,
                    child: Container(
                      height: 100,
                      width: double.infinity,
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: getTechniqueThumbnail(technique),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    technique.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    technique.category.title,
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
                                                  Text(technique.difficulty.string),
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
                                                  Text(technique.productId.isPresent ? "99.99\$" : "Free"),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (showFavoriteIcon)
                                          Icon(
                                            user.favoriteTechniques.contains(technique.id) ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                            color: BASE_COLOR,
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
              } else
                return _LoadingEffect();
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
    );
  }
}

class _LoadingEffect extends StatelessWidget {
  final bool showFavoriteIcon;

  const _LoadingEffect({Key? key, this.showFavoriteIcon = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: Container(
        height: 100,
        width: double.infinity,
        color: Colors.transparent,
        child: Row(
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 14,
                      width: 100,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 14,
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
                                      height: 12,
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
                                    // TODO
                                    Container(
                                      height: 12,
                                      width: 50,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if (showFavoriteIcon)
                            Icon(
                              Icons.favorite_rounded,
                              color: BASE_COLOR,
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
    );
  }
}
