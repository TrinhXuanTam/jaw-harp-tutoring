import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/shimmer_effect.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique/technique_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

/// Small technique list.
class SmallTechniqueList extends StatelessWidget {
  final List<String> techniquesIds;

  const SmallTechniqueList({
    Key? key,
    required this.techniquesIds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return ListView.separated(
      itemCount: techniquesIds.length,
      itemBuilder: (ctx, index) {
        final id = techniquesIds[index];

        return BlocProvider<TechniqueBloc>(
          create: (ctx) => serviceLocator<TechniqueBloc>()..add(LoadTechnique(id)),
          child: BlocBuilder<TechniqueBloc, TechniqueState>(
            builder: (ctx, state) {
              if (state is TechniqueLoaded) {
                final technique = state.technique;
                final user = getUser(ctx);

                return GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    TECHNIQUE_DETAIL_SCREEN_ROUTE,
                    arguments: TechniqueScreenArgs(
                      technique,
                      hasAccessToTechnique(context, technique),
                    ),
                  ),
                  child: Container(
                    height: 90,
                    width: double.infinity,
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
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  technique.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.timelapse_rounded,
                                                color: BASE_COLOR,
                                                size: 15,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                l10n.translate(technique.difficulty.string),
                                                style: const TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 4),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.attach_money_rounded,
                                                color: BASE_COLOR,
                                                size: 15,
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                getPriceTag(context, technique),
                                                style: const TextStyle(fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      user.favoriteTechniques.contains(technique.id) ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                                      color: BASE_COLOR,
                                      size: 20,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else
                return const _LoadingEffect();
            },
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
    );
  }
}

/// Loading effect for small technique list.
class _LoadingEffect extends StatelessWidget {
  const _LoadingEffect();

  @override
  Widget build(BuildContext context) {
    return ShimmerEffect(
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 90,
        width: double.infinity,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.grey,
                  width: double.infinity,
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
                      height: 13,
                      width: 100,
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
                                    const Icon(
                                      Icons.timelapse_rounded,
                                      color: BASE_COLOR,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 4),
                                    Container(
                                      height: 12,
                                      width: 50,
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.attach_money_rounded,
                                      color: BASE_COLOR,
                                      size: 15,
                                    ),
                                    const SizedBox(width: 4),
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
                          const Icon(
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
    );
  }
}
