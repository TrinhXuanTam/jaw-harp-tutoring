import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/techniques/domain/entities/media.dart';
import 'package:jews_harp/core/utils.dart';

class ScrollableTechniqueList extends StatelessWidget {
  final List<ScrollableTechniqueListItem> items;
  final double? height;

  const ScrollableTechniqueList({Key? key, required this.items, this.height}) : super(key: key);

  Widget _getThumbnail(ScrollableTechniqueListItem item) {
    final thumbnail = item.thumbnail != null
        ? getImageFromMedia(item.thumbnail!)
        : Container(
            color: BASE_COLOR_VERY_LIGHT,
            padding: const EdgeInsets.all(5),
            child: Icon(
              Icons.image_not_supported_outlined,
              color: BASE_COLOR,
            ),
          );

    return Container(
      height: 70,
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: FittedBox(
          fit: BoxFit.cover,
          child: thumbnail,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        alignment: Alignment.center,
        width: size.width * 0.9,
        height: this.height,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
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
                                  _getThumbnail(items[index]),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          items[index].productId,
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        SizedBox(height: 1),
                                        Text(
                                          items[index].title,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
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
                "No techniques",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}

class ScrollableTechniqueListItem {
  final VoidCallback onTap;
  final Media? thumbnail;
  final String productId;
  final String title;

  ScrollableTechniqueListItem({
    required this.onTap,
    this.thumbnail,
    required this.title,
    required this.productId,
  });
}
