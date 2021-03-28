import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/errors/media_not_found_error.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:random_color/random_color.dart';
import 'package:video_player/video_player.dart';

Widget getImageFromMedia(Media media) {
  if (media.filePath.isPresent)
    return Image.file(File(media.filePath.value));
  else if (media.url.isPresent)
    return CachedNetworkImage(
      imageUrl: media.url.value,
      placeholder: (context, url) => Container(
        color: Colors.transparent,
      ),
    );
  else
    throw MediaNotFoundError();
}

VideoPlayerController getVideoPlayerControllerFromMedia(Media media) {
  if (media.filePath.isPresent)
    return VideoPlayerController.file(File(media.filePath.value));
  else if (media.url.isPresent) {
    return VideoPlayerController.network(media.url.value);
  } else
    throw MediaNotFoundError();
}

User getUser(BuildContext context) {
  final state = BlocProvider.of<AuthBloc>(context).state;
  if (state is AuthenticatedState) {
    return state.user;
  } else
    throw UserNotSignedInError();
}

Color getRandomShade(int seed) {
  final hue = getColorNameFromColor(BASE_COLOR).getHue;
  return RandomColor(seed).randomColor(
    colorHue: ColorHue.custom(Range(hue, hue)),
    colorSaturation: ColorSaturation.highSaturation,
    colorBrightness: ColorBrightness.random,
  );
}

extension CategoryRandomColor on Category {
  Color getColor() => getRandomShade(this.title.hashCode);
}

VoidCallback videoOnTap(VideoPlayerController controller) {
  // Video has ended
  if (controller.value.position.inSeconds == controller.value.duration.inSeconds) {
    return () {
      controller.seekTo(Duration.zero);
      controller.play();
    };
  } else if (controller.value.isPlaying) {
    return () => controller.pause();
  } else {
    return () => controller.play();
  }
}

int techniqueDatePublishedComparator(Technique lhs, Technique rhs) {
  if (lhs.datePublished.isEmpty && rhs.datePublished.isEmpty)
    return 0;
  else if (lhs.datePublished.isEmpty)
    return 1;
  else if (rhs.datePublished.isEmpty)
    return -1;
  else
    return rhs.datePublished.value.compareTo(lhs.datePublished.value);
}

Widget generateProfilePhoto(BuildContext context, {double? size}) {
  final user = getUser(context);
  final words = user.name.split(" ");

  return ClipOval(
    child: Container(
      width: size,
      height: size,
      color: getRandomShade(user.name.hashCode),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            words.take(2).map((e) => e[0]).join(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildProfilePhoto(BuildContext context, {double? size}) {
  final user = getUser(context);

  if (user.profilePictureUrl.isEmpty)
    return generateProfilePhoto(context, size: size);
  else
    return CachedNetworkImage(
      imageUrl: user.profilePictureUrl.value,
      imageBuilder: (ctx, imageProvider) => ClipOval(
        child: Container(
          width: size,
          height: size,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image(image: imageProvider),
          ),
        ),
      ),
      placeholder: (context, url) => generateProfilePhoto(context, size: size),
      errorWidget: (ctx, url, error) => generateProfilePhoto(context, size: size),
    );
}
