import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final testData = [
      {
        "title": "Advanced Techniques",
        "description": "Try out new stuff!",
      },
    ];

    return Scaffold(
      appBar: IconAppBar(
        icon: Icons.close_rounded,
        iconColor: BASE_COLOR,
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            children: [
              TitleWithSubtitle(
                titleText: "Categories",
                subtitleText: "Filter techniques by category",
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Scrollbar(
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 4,
                      itemCount: 3,
                      itemBuilder: (BuildContext context, int index) => Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: index == 0 ? BASE_COLOR : Colors.white,
                          border: Border.all(color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              testData[0]["title"]!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: index == 0 ? Colors.white : BASE_COLOR,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              testData[0]["description"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: index == 0 ? Colors.white : Colors.black,
                              ),
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                "6 items",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: index == 0 ? Colors.white : BASE_COLOR,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      staggeredTileBuilder: (int index) => StaggeredTile.fit(2),
                      mainAxisSpacing: 4,
                      crossAxisSpacing: 4,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
