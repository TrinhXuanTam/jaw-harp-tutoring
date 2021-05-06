import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/features/user_section/presentation/screens/video_full_screen_mode_screen.dart';
import 'package:jews_harp/features/user_section/utils.dart';
import 'package:video_player/video_player.dart';

/// Video control panel.
class VideoControls extends StatelessWidget {
  final VideoPlayerController controller;
  final List<double> _playbackSpeeds = const [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];
  final bool fullscreen;

  const VideoControls({
    Key? key,
    required this.controller,
    required this.fullscreen,
  }) : super(key: key);

  String _getPosition() {
    final duration = Duration(milliseconds: controller.value.position.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2, '0')).join(":");
  }

  String _getVideoLength() {
    final duration = Duration(milliseconds: controller.value.duration.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2, '0')).join(":");
  }

  Widget _buildFullscreenButton(BuildContext context) {
    if (this.fullscreen)
      return GestureDetector(
        onTap: () {
          controller.pause();
          Navigator.pop(context);
        },
        child: Icon(
          Icons.fullscreen_exit,
          color: Colors.white,
          size: 25,
        ),
      );
    else {
      return GestureDetector(
        onTap: () {
          controller.pause();
          Navigator.pushNamed(context, VIDEO_FULL_SCREEN_SCREEN_ROUTE, arguments: VideoFullScreenModeScreenArgs(this.controller));
        },
        child: Icon(
          Icons.fullscreen_rounded,
          color: Colors.white,
          size: 25,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 5),
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (ctx, value, child) {
            late final IconData icon;

            // Video has ended
            if (controller.value.position.inSeconds == controller.value.duration.inSeconds) {
              icon = Icons.replay_rounded;
            } else if (controller.value.isPlaying) {
              icon = Icons.pause_rounded;
            } else {
              icon = Icons.play_arrow_rounded;
            }

            return GestureDetector(
              onTap: videoOnTap(controller),
              child: Icon(
                icon,
                size: 25,
                color: Colors.white,
              ),
            );
          },
        ),
        const SizedBox(width: 5),
        Expanded(
          child: VideoProgressIndicator(
            controller,
            allowScrubbing: true,
            colors: const VideoProgressColors(
              backgroundColor: Colors.white,
              bufferedColor: BASE_COLOR_VERY_LIGHT,
              playedColor: BASE_COLOR,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 5),
          alignment: Alignment.centerLeft,
          child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (ctx, value, child) => Text(
              _getPosition(),
              style: const TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            " / " + _getVideoLength(),
            style: const TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        SizedBox(width: 10),
        ValueListenableBuilder(
          valueListenable: controller,
          builder: (ctx, value, child) => PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            onSelected: (value) => controller.setPlaybackSpeed(value),
            itemBuilder: (_) => _playbackSpeeds.map((speed) => PopupMenuItem(child: Text("${speed}x"), value: speed)).toList(),
            child: Text(
              "${controller.value.playbackSpeed}x",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 10),
        _buildFullscreenButton(context),
        const SizedBox(width: 5),
      ],
    );
  }
}
