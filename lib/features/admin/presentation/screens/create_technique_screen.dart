import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/rounded_text_field.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';

class CreateTechniqueScreen extends StatefulWidget {
  @override
  _CreateTechniqueScreenState createState() => _CreateTechniqueScreenState();
}

class _CreateTechniqueScreenState extends State<CreateTechniqueScreen> {
  final _idController = TextEditingController();
  final _thumbnailController = ThumbnailPickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              RoundedTextField(
                icon: Icons.attach_money_rounded,
                controller: _idController,
                placeholderText: "Product ID",
              ),
              SizedBox(height: 10),
              ThumbnailPicker(controller: _thumbnailController),
              SizedBox(height: 10),
              RoundedButton(
                text: "Create",
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
