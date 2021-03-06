import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

class BorderedList extends StatelessWidget {
  final List<BorderedListItem> items;

  const BorderedList({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final l10n = AppLocalizations.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: items.map((item) {
            return Column(
              children: [
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: item.onTap,
                    child: Container(
                      padding: EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Icon(item.icon, color: BASE_COLOR),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  l10n.translate(item.title),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 1),
                                Text(
                                  l10n.translate(item.description),
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
                if (items.indexOf(item) != items.length - 1)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(height: 1.5, color: Colors.grey),
                  ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BorderedListItem {
  final VoidCallback onTap;
  final IconData icon;
  final String title;
  final String description;

  BorderedListItem({
    required this.onTap,
    required this.icon,
    required this.title,
    required this.description,
  });
}
