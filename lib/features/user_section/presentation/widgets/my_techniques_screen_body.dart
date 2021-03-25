import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';

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
                      Container(),
                      Container(),
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
