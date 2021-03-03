import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/full_screen_container.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/widgets/bordered_list.dart';

class AdminMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: IconAppBar(
        backgroundColor: BASE_COLOR,
        iconColor: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          BigAppBarBackground(),
          Container(
            width: size.width * 0.9,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Admin Menu",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Here you can manage techniques and categories to offer your customers new content.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                BorderedList(
                  items: [
                    BorderedListItem(
                      onTap: () {},
                      icon: Icons.article_outlined,
                      title: "Manage Techniques",
                      description: "Update, delete or create new techniques.",
                    ),
                    BorderedListItem(
                      onTap: () {},
                      icon: Icons.folder_open,
                      title: "Manage Categories",
                      description: "Update, delete or create new categories to group techniques.",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
