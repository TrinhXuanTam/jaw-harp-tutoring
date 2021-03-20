import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class TechniqueList extends StatelessWidget {
  final List<Technique> techniques;
  final bool showCategory;

  const TechniqueList({
    Key? key,
    required this.techniques,
    this.showCategory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

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

        return Container(
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
            ],
          ),
        );
      },
    );
  }
}
