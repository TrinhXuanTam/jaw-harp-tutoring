import 'package:flutter/material.dart';
import 'package:jews_harp/core/widgets/transparent_icon_app_bar.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class VideoFullScreenModeScreenArgs {
  final VideoPlayerController controller;

  VideoFullScreenModeScreenArgs(this.controller);
}

/// Video full screen mode.
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
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: IconAppBar(
        icon: Icons.close_rounded,
        iconColor: Colors.white,
        onPressed: () {
          controller.pause();
          Navigator.pop(context);
        },
      ),
      body: VideoPlayerWidget(
        controller: this.controller,
        fullscreen: true,
      ),
    );
  }
}
