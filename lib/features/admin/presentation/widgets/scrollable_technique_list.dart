import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/utils.dart';

/// Technique list for admin menu.
class ScrollableTechniqueList extends StatelessWidget {
  final void Function(Technique technique) onTap;
  final List<Technique> items;
  final double? height;

  const ScrollableTechniqueList({
    Key? key,
    required this.onTap,
    required this.items,
    this.height,
  }) : super(key: key);

  Widget _getThumbnail(Technique item) {
    final thumbnail = item.thumbnail.isPresent
        ? getImageFromMedia(item.thumbnail.value)
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

  Widget _getProductStatus(Technique technique) {
    final productInfo = technique.productInfo;
    if (productInfo.type == ProductType.free)
      return Text(
        "Free",
        style: TextStyle(color: Colors.grey),
      );
    else if (productInfo.type == ProductType.unavailable)
      return Text(
        "Unavailable",
        style: TextStyle(color: Colors.redAccent),
      );
    else
      return Text(
        productInfo.price!,
        style: TextStyle(color: Colors.green),
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
                            onTap: () => onTap(items[index]),
                            child: Container(
                              padding: const EdgeInsets.all(14),
                              child: Row(
                                children: [
                                  _getThumbnail(items[index]),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        _getProductStatus(items[index]),
                                        const SizedBox(height: 1),
                                        Text(
                                          items[index].title,
                                          style: const TextStyle(
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: const Divider(height: 1.5, color: Colors.grey),
                        ),
                      ],
                    );
                  },
                ),
              )
            : const Text(
                "No techniques",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
      ),
    );
  }
}
