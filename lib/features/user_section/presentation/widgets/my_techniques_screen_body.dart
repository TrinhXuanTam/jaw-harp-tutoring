import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/downloaded_techniques_list.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/technique_list.dart';
import 'package:jews_harp/features/user_section/utils.dart';

class MyTechniquesScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CenteredStack(
      children: [
        DefaultTabController(
          length: 3,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))),
                  child: TabBar(
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.black,
                    tabs: [
                      Tab(text: "My Techniques"),
                      Tab(text: "Downloaded"),
                      Tab(text: "Favorites"),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Container(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: DownloadedTechniquesList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TechniqueList(techniqueIds: getUser(context).favoriteTechniques.toList()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
