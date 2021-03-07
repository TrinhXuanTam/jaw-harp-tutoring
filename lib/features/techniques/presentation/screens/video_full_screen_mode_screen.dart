import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
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

    return Container(
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
          VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: VideoProgressColors(
              backgroundColor: Colors.white,
              bufferedColor: BASE_COLOR_VERY_LIGHT,
              playedColor: BASE_COLOR,
            ),
          ),
        ],
      ),
    );
  }
}
