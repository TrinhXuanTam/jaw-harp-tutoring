import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';

class SimpleMenu extends StatelessWidget {
  final String title;
  final List<SimpleMenuItem> items;

  const SimpleMenu({
    Key? key,
    required this.title,
    this.items = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              this.title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
              ),
            ),
          ),
          ...items.map((item) {
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: item.onTap,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(fontSize: 17),
                      ),
                      Icon(
                        Icons.navigate_next_rounded,
                        color: BASE_COLOR,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class SimpleMenuItem {
  final String title;
  final VoidCallback onTap;

  SimpleMenuItem(this.title, this.onTap);
}
