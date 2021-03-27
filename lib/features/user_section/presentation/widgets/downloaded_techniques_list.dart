import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/presentation/BLoCs/technique_local_storage/technique_local_storage_bloc.dart';
import 'package:jews_harp/features/user_section/presentation/screens/technique_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class DownloadedTechniquesList extends StatelessWidget {
  Widget _buildThumbnail(Technique technique) {
    if (technique.thumbnail.isPresent)
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
          child: Image.asset(
            LOGO_LOCATION,
            width: 30,
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
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
            openBuilder: (ctx, _) => TechniqueScreen(technique: item),
            closedBuilder: (ctx, openContainer) => GestureDetector(
              onTap: openContainer,
              child: Container(
                height: 140,
                width: double.infinity,
                color: Colors.transparent,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        child: Container(
                          width: 170,
                          height: double.infinity,
                          child: _buildThumbnail(item),
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
        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10),
      );
    });
  }
}