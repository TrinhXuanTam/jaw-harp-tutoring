import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/routes.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/dependency_injection/service_locator.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/core/widgets/rounded_input_field_container.dart';
import 'package:jews_harp/features/admin/presentation/BLoCs/video_picker/video_picker_bloc.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/presentation/screens/video_full_screen_mode_screen.dart';
import 'package:video_player/video_player.dart';

/// Video picker button with preview.
class VideoPicker extends StatelessWidget {
  final VideoPickerController controller;

  const VideoPicker({
    Key? key,
    required this.controller,
  }) : super(key: key);

  Widget _videoPickerBlocBuilder(BuildContext context, VideoPickerState state) {
    final l10n = AppLocalizations.of(context);

    if (state is VideoPickedState)
      return GestureDetector(
        onTap: () => Navigator.pushNamed(context, VIDEO_FULL_SCREEN_SCREEN_ROUTE, arguments: VideoFullScreenModeScreenArgs(state.playableVideo)),
        child: RoundedInputField(
          padding: EdgeInsets.zero,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: double.infinity,
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
                  height: double.infinity,
                  color: BASE_COLOR_VERY_LIGHT.withAlpha(170),
                  child: const Icon(
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
                    child: const Icon(
                      Icons.close_rounded,
                      color: BASE_COLOR,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    else
      return GestureDetector(
        onTap: () => BlocProvider.of<VideoPickerBloc>(context).add(PickVideoEvent()),
        child: RoundedInputField(
          padding: EdgeInsets.zero,
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Icon(
                      Icons.movie_outlined,
                      color: BASE_COLOR,
                      size: 70,
                    ),
                    Text(
                      l10n.translate("Choose Video"),
                      style: const TextStyle(
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
      child: BlocConsumer<VideoPickerBloc, VideoPickerState>(
        listener: _videoPickerBlocListener,
        builder: _videoPickerBlocBuilder,
      ),
    );
  }
}

class VideoPickerController {
  Media? video;

  VideoPickerController({this.video});
}
