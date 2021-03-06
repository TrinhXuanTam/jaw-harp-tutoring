import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

class ScrollableCategoryList extends StatelessWidget {
  final List<ScrollableCategoryListItem> items;
  final double height;

  const ScrollableCategoryList({
    Key key,
    @required this.items,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.9,
        height: this.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]),
          borderRadius: BorderRadius.circular(15),
        ),
        child: items.isNotEmpty
            ? Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: items.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: items[index].onTap,
                            child: Container(
                              padding: EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        items[index].techniqueCnt.toString(),
                                        style: TextStyle(
                                          color: BASE_COLOR,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "items",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: BASE_COLOR,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          localizations.translate(items[index].title),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: 1),
                                        Text(
                                          localizations.translate(items[index].description),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Divider(height: 1.5, color: Colors.grey),
                        ),
                      ],
                    );
                  },
                ),
              )
            : Text(
                "No categories",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}

class ScrollableCategoryListItem {
  final Function onTap;
  final int techniqueCnt;
  final String title;
  final String description;

  ScrollableCategoryListItem(
    this.onTap,
    this.techniqueCnt,
    this.title,
    this.description,
  );
}
