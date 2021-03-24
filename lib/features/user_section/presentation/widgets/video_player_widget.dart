import 'package:flutter/material.dart';
import 'package:jews_harp/features/user_section/presentation/widgets/video_controls.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;
  final bool fullscreen;

  const VideoPlayerWidget({
    Key? key,
    required this.controller,
    required this.fullscreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final videoSize = controller.value.size;

    return Container(
      color: Colors.black,
      width: double.infinity,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GestureDetector(
                onTap: () {
                  videoOnTap(controller)();
                },
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2),
                color: Colors.black.withOpacity(0.5),
                child: VideoControls(
                  controller: controller,
                  fullscreen: this.fullscreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
