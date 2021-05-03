import 'package:flutter/material.dart';
import 'package:jews_harp/core/l10n.dart';

/// Menu with tabs
class TabMenu extends StatelessWidget {
  final List<TabMenuItem> items;
  final bool isScrollable;

  const TabMenu({
    Key? key,
    required this.items,
    this.isScrollable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return DefaultTabController(
      length: items.length,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
            child: TabBar(
              isScrollable: this.isScrollable,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              tabs: items.map((item) => Tab(text: l10n.translate(item.title))).toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: items.map((item) => item.body).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TabMenuItem {
  final String title;
  final Widget body;

  TabMenuItem({
    required this.title,
    required this.body,
  });
}
