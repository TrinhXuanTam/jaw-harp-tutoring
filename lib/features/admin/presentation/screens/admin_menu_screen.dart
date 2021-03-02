import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/widgets/list_tile_button.dart';

class AdminMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      appBar: TransparentIconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.9,
              alignment: Alignment.centerLeft,
              child: Text(
                "Admin Menu",
                style: TextStyle(
                  fontSize: 25,
                  color: BASE_COLOR,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            ListTileButton(
              icon: Icons.article_outlined,
              title: "Manage Techniques",
              description: "Update, delete or create new techniques.",
              onTap: () {},
            ),
            SizedBox(height: 10),
            ListTileButton(
              icon: Icons.folder_open,
              title: "Manage Categories",
              description: "Update, delete or create new categories to group techniques.",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
