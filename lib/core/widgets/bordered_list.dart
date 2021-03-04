import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/l10n.dart';

class BorderedList extends StatelessWidget {
  final List<BorderedListItem> items;

  const BorderedList({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final localizations = AppLocalizations.of(context);

    Widget _getBorderRadius(BorderedListItem item, Widget child) {
      final index = items.indexOf(item);
      final length = items.length;

      if (index == 0 && index == length - 1)
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: child,
          ),
        );
      if (index == 0)
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: child,
          ),
        );
      else if (index == length - 1)
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: child,
          ),
        );
      else
        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: item.onTap,
            child: child,
          ),
        );
    }

    return Container(
      width: size.width * 0.9,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[300]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: items.map((item) {
                final child = Container(
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
                              localizations.translate(item.title),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 1),
                            Text(
                              localizations.translate(item.description),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );

                return Column(
                  children: [
                    _getBorderRadius(item, child),
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
        ],
      ),
    );
  }
}

class BorderedListItem {
  final Function onTap;
  final IconData icon;
  final String title;
  final String description;

  BorderedListItem({
    @required this.onTap,
    @required this.icon,
    @required this.title,
    @required this.description,
  });
}
