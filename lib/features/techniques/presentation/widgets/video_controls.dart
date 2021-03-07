import 'package:flutter/material.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:video_player/video_player.dart';

class VideoControls extends StatelessWidget {
  final VideoPlayerController controller;
  final List<double> _playbackSpeeds = const [0.25, 0.5, 0.75, 1, 1.25, 1.5, 1.75, 2];

  const VideoControls({Key? key, required this.controller}) : super(key: key);

  String _getPosition() {
    final duration = Duration(milliseconds: controller.value.position.inMilliseconds.round());
    return [duration.inMinutes, duration.inSeconds].map((e) => e.remainder(60).toString().padLeft(2, '0')).join(":");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          alignment: Alignment.centerLeft,
          child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (ctx, value, child) => Text(
              _getPosition(),
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
        ),
        Row(
          children: [
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (ctx, value, child) => GestureDetector(
                onTap: () => controller.value.isPlaying ? controller.pause() : controller.play(),
                child: Icon(
                  controller.value.isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  size: 20,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: VideoProgressIndicator(
                controller,
                allowScrubbing: true,
                colors: VideoProgressColors(
                  backgroundColor: Colors.white,
                  bufferedColor: BASE_COLOR_VERY_LIGHT,
                  playedColor: BASE_COLOR,
                ),
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(
                Icons.fullscreen_exit,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
