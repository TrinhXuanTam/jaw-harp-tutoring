import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/small_technique_card.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:optional/optional.dart';

/// Category detail with a list of techniques.
class CategoryDetail extends StatelessWidget {
  final String title;
  final String description;
  final Optional<Media> thumbnail;
  final List<String> techniqueIds;

  const CategoryDetail({
    Key? key,
    required this.title,
    required this.description,
    this.thumbnail = const Optional.empty(),
    required this.techniqueIds,
  }) : super(key: key);

  Widget _buildThumbnail(Color categoryColor) {
    final thumbnail = this.thumbnail;

    if (thumbnail.isPresent) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: FittedBox(
          fit: BoxFit.cover,
          child: getImageFromMedia(thumbnail.value),
        ),
      );
    } else {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: categoryColor,
          child: Image.asset(
            LOGO_LOCATION,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categoryColor = getRandomShade(this.title.hashCode);

    return Scaffold(
      appBar: IconAppBar(
        backgroundColor: this.thumbnail.isPresent ? Colors.white : categoryColor,
        iconColor: this.thumbnail.isPresent ? Colors.black : Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              children: [
                Stack(
                  children: [
                    _buildThumbnail(categoryColor),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Container(
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                l10n.translate(this.title),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              child: Text(
                                l10n.translate(this.description),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    color: Colors.white,
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: this.techniqueIds.length,
                      itemBuilder: (BuildContext context, int index) => Container(
                        child: SmallTechniqueCard(techniqueId: this.techniqueIds[index]),
                      ),
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
