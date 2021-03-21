import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/errors/media_not_found_error.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/login_screen_redirect/auth_bloc.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:random_color/random_color.dart';
import 'package:video_player/video_player.dart';

Image getImageFromMedia(Media media) {
  if (media.filePath.isPresent)
    return Image.file(File(media.filePath.value));
  else if (media.url.isPresent)
    return Image.network(media.url.value);
  else
    throw MediaNotFoundError();
}

VideoPlayerController getVideoPlayerControllerFromMedia(Media media) {
  if (media.filePath.isPresent)
    return VideoPlayerController.file(File(media.filePath.value));
  else if (media.url.isPresent)
    return VideoPlayerController.network(media.url.value);
  else
    throw MediaNotFoundError();
}

User getUser(BuildContext ctx) {
  final state = BlocProvider.of<AuthBloc>(ctx).state;
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

Widget defaultHorizontalSharedAxisTransition(Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
  return SharedAxisTransition(
    child: child,
    animation: primaryAnimation,
    secondaryAnimation: secondaryAnimation,
    transitionType: SharedAxisTransitionType.horizontal,
  );
}

Widget defaultFadeThroughTransition(Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
  return FadeThroughTransition(
    child: child,
    animation: primaryAnimation,
    secondaryAnimation: secondaryAnimation,
  );
}

Widget defaultFadeTransition(Widget child, Animation<double> primaryAnimation, Animation<double> secondaryAnimation) {
  return FadeScaleTransition(
    child: child,
    animation: primaryAnimation,
  );
}

extension CategoryRandomColor on Category {
  Color getColor(BuildContext context) => getRandomShade(this.title(context).hashCode);
}

extension CategoryLocalization on Category {
  String title(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return this.getLocalizedTitle(l10n.locale.languageCode);
  }

  String description(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return this.getLocalizedDescription(l10n.locale.languageCode);
  }
}
