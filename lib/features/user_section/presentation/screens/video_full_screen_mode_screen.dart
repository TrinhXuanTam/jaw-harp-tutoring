import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_controls.dart';
import 'package:video_player/video_player.dart';

class VideoFullScreenModeScreenArgs {
  final VideoPlayerController controller;

  VideoFullScreenModeScreenArgs(this.controller);
}

class VideoFullScreenModeScreen extends StatelessWidget {
  final VideoPlayerController controller;

  factory VideoFullScreenModeScreen.fromArgs(VideoFullScreenModeScreenArgs args) {
    return VideoFullScreenModeScreen(controller: args.controller);
  }

  const VideoFullScreenModeScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoSize = controller.value.size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        icon: Icons.close_rounded,
        iconColor: Colors.white,
        onPressed: () => Navigator.pop(context),
      ),
      body: Container(
        color: Colors.black,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => controller.value.isPlaying ? controller.pause() : controller.play(),
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: videoSize.width,
                  height: videoSize.height,
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
            ),
            VideoControls(controller: controller),
          ],
        ),
      ),
    );
  }
}
