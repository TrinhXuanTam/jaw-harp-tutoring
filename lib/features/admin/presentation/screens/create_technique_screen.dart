import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';

class CreateTechniqueScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        onPressed: () => Navigator.pop(context),
      ),
      body: CenteredStack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TitleWithSubtitle(
                titleText: "Create Technique",
                titleSize: 35,
                subtitleText: "Create a new technique",
              ),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
