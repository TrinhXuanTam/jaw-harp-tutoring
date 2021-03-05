import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/big_app_bar_background.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/widgets/scrollable_category_list.dart';

class CategoryListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "Visible Categories",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Here you can browse through visible categories. Users can see these categories and their content in their app.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 15),
                ScrollableCategoryList(
                  items: [
                    ScrollableCategoryListItem(() {}, 3, "Beginner's", "Learn new stuff"),
                    ScrollableCategoryListItem(() {}, 10, "Advanced", "Train your skills"),
                    ScrollableCategoryListItem(() {}, 36, "Free", "Try out free content"),
                    ScrollableCategoryListItem(() {}, 99, "Free", "Very long teeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeext"),
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
