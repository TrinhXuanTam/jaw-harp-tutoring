import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/centered_stack.dart';
import 'package:jews_harp/core/widgets/rounded_button.dart';
import 'package:jews_harp/core/widgets/title_with_subtitle.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/admin/presentation/widgets/thumbnail_picker.dart';
import 'package:jews_harp/features/admin/presentation/widgets/video_picker.dart';

class UploadFilesScreenArgs {
  final ThumbnailPickerController? thumbnailController;
  final VideoPickerController? videoController;

  UploadFilesScreenArgs({this.thumbnailController, this.videoController});
}

/// Screen for uploading files.
class UploadFilesScreen extends StatelessWidget {
  final ThumbnailPickerController? thumbnailController;
  final VideoPickerController? videoController;

  factory UploadFilesScreen.fromArgs(UploadFilesScreenArgs args) {
    return UploadFilesScreen(
      thumbnailController: args.thumbnailController,
      videoController: args.videoController,
    );
  }

  const UploadFilesScreen({
    Key? key,
    required this.thumbnailController,
    required this.videoController,
  }) : super(key: key);

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
              const TitleWithSubtitle(
                titleText: "Choose Files",
                titleSize: 35,
                subtitleText: "Choose files to upload",
              ),
              const SizedBox(height: 20),
              if (thumbnailController != null)
                Column(
                  children: [
                    ThumbnailPicker(controller: thumbnailController!),
                    const SizedBox(height: 10),
                  ],
                ),
              if (videoController != null) VideoPicker(controller: videoController!),
              const SizedBox(height: 20),
              RoundedButton(
                text: "Done",
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
