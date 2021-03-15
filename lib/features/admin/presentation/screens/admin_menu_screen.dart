import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/bordered_list.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

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
      backgroundColor: Colors.grey[200],
      body: CenteredStack(
        children: [
          Positioned(
            top: 0,
            child: BigAppBarBackground(height: size.height * 0.2),
          ),
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
                Column(
                  children: [
                    BorderedList(
                      items: [
                        BorderedListItem(
                          onTap: () => Navigator.pushNamed(context, CREATE_TECHNIQUE_SCREEN_ROUTE),
                          icon: Icons.add,
                          title: "Create Technique",
                          description: "Create a new technique.",
                        ),
                        BorderedListItem(
                          onTap: () => Navigator.pushNamed(context, TECHNIQUE_LIST_SCREEN_ROUTE),
                          icon: Icons.list_alt_rounded,
                          title: "Browse Techniques",
                          description: "Browse through all techniques.",
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    BorderedList(
                      items: [
                        BorderedListItem(
                          onTap: () => Navigator.pushNamed(context, CREATE_CATEGORY_SCREEN_ROUTE),
                          icon: Icons.create_new_folder_outlined,
                          title: "Create Category",
                          description: "Create a new category to group techniques.",
                        ),
                        BorderedListItem(
                          onTap: () => Navigator.pushNamed(context, VISIBLE_CATEGORIES_LIST_SCREEN_ROUTE),
                          icon: Icons.public,
                          title: "Visible Categories",
                          description: "Categories that are visible to the public.",
                        ),
                        BorderedListItem(
                          onTap: () => Navigator.pushNamed(context, HIDDEN_CATEGORIES_LIST_SCREEN_ROUTE),
                          icon: Icons.public_off_rounded,
                          title: "Hidden Categories",
                          description: "Categories that are not visible to the public.",
                        ),
                      ],
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
