import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/full_screen_container.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

class ManageCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: FullScreenContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.9,
              alignment: Alignment.centerLeft,
              child: Text(
                "Manage Categories",
                style: TextStyle(
                  fontSize: 25,
                  color: BASE_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            // ListTileButton(
            //   icon: Icons.create_new_folder_outlined,
            //   title: "Create Category",
            //   description: "Create a new category to group techniques.",
            //   onTap: () => Navigator.pushNamed(context, CREATE_CATEGORY_SCREEN_ROUTE),
            // ),
            SizedBox(height: 30),
            Container(
              width: size.width * 0.9,
              alignment: Alignment.centerLeft,
              child: Text(
                "Inactive Categories",
                style: TextStyle(
                  fontSize: 19,
                  color: BASE_COLOR,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
