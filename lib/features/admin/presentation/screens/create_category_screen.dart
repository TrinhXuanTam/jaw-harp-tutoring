import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/full_screen_container.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

class CreateCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: FullScreenContainer(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: size.width * 0.9,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Create Category",
                  style: TextStyle(
                    fontSize: 25,
                    color: BASE_COLOR,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                width: size.width * 0.9,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(
                          Icons.public_sharp,
                          color: BASE_COLOR,
                          size: 25,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Visibility:",
                              style: TextStyle(color: BASE_COLOR, fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                            Text(
                              "Enable if you want the category and its content to be visible to the public.",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(color: BASE_COLOR, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
