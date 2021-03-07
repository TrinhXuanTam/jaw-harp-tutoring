import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart';
import 'package:jews_harp/features/techniques/presentation/screens/video_full_screen_mode_screen.dart';
import 'package:video_player/video_player.dart';

class VideoPicker extends StatelessWidget {
  final VideoPickerController controller;
  final double height;

  const VideoPicker({
    Key? key,
    required this.controller,
    this.height = 135,
  }) : super(key: key);

  Widget _videoPickerBlocBuilder(BuildContext context, VideoPickerState state) {
    if (state is VideoPickedState)
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, VIDEO_FULL_SCREEN_SCREEN_ROUTE, arguments: VideoFullScreenModeScreenArgs(state.playableVideo)),
        child: Container(
          height: this.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: double.infinity,
                height: this.height,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: state.playableVideo.value.size.width,
                    height: state.playableVideo.value.size.height,
                    child: AspectRatio(
                      aspectRatio: state.playableVideo.value.aspectRatio,
                      child: VideoPlayer(state.playableVideo),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: this.height,
                color: BASE_COLOR_VERY_LIGHT.withAlpha(170),
                child: Icon(
                  Icons.play_circle_outline_rounded,
                  size: 90,
                  color: BASE_COLOR,
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<VideoPickerBloc>(context).add(RemoveVideoEvent()),
                  child: Icon(
                    Icons.close_rounded,
                    color: BASE_COLOR,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    else
      return GestureDetector(
        onTap: () => BlocProvider.of<VideoPickerBloc>(context).add(PickVideoEvent()),
        child: Container(
          height: this.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.movie_outlined,
                    color: BASE_COLOR,
                    size: 70,
                  ),
                  Text(
                    "Choose Video",
                    style: TextStyle(
                      color: BASE_COLOR,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }

  void _videoPickerBlocListener(BuildContext context, VideoPickerState state) {
    if (state is NoVideoPickedState)
      controller.video = null;
    else if (state is VideoPickedState) controller.video = state.video;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VideoPickerBloc>(
      create: (_) {
        final bloc = serviceLocator<VideoPickerBloc>();
        bloc.add(UploadScreenLoadedEvent(video: controller.video));
        return bloc;
      },
      child: RoundedInputField(
        padding: EdgeInsets.zero,
        child: BlocConsumer<VideoPickerBloc, VideoPickerState>(
          listener: _videoPickerBlocListener,
          builder: _videoPickerBlocBuilder,
        ),
      ),
    );
  }
}

class VideoPickerController {
  File? video;

  VideoPickerController({this.video});
}
