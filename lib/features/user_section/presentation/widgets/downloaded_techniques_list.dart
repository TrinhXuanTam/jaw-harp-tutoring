import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

/// Downloaded techniques list.
class DownloadedTechniquesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return BlocBuilder<TechniqueLocalStorageBloc, TechniqueLocalStorageState>(builder: (ctx, state) {
      final techniques = state.downloadedTechniques.values.toList();
      final user = getUser(context);

      return ListView.separated(
        itemCount: state.downloadedTechniques.length,
        itemBuilder: (ctx, index) {
          final item = techniques[index];

          return OpenContainer(
            openElevation: 0,
            closedElevation: 0,
            transitionType: ContainerTransitionType.fadeThrough,
            openBuilder: (ctx, _) => TechniqueScreen(technique: item, hasAccess: true),
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
                        child: getTechniqueThumbnail(item),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              item.category.title,
                              style: const TextStyle(
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
                                            const Icon(
                                              Icons.timelapse_rounded,
                                              color: BASE_COLOR,
                                              size: 15,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(l10n.translate(item.difficulty.string)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    user.favoriteTechniques.contains(item.id) ? Icons.favorite_rounded : Icons.favorite_border_rounded,
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
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10),
      );
    });
  }
}
