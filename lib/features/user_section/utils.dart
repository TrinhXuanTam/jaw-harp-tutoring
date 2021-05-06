import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jews_harp/core/constants/locations.dart';
import 'package:jews_harp/core/constants/theme.dart';
import 'package:jews_harp/core/errors/media_not_found_error.dart';
import 'package:jews_harp/core/errors/user_not_signed_in_error.dart';
import 'package:jews_harp/core/l10n.dart';
import 'package:jews_harp/features/auth/domain/entities/user.dart';
import 'package:jews_harp/features/auth/presentation/BLoCs/auth_state/auth_bloc.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:random_color/random_color.dart';
import 'package:video_player/video_player.dart';

/// Extract the image from Media entity.
Widget getImageFromMedia(Media media) {
  if (media.filePath.isPresent)
    return Image.file(File(media.filePath.value));
  else if (media.url.isPresent)
    // Cache the image.
    return CachedNetworkImage(
      imageUrl: media.url.value,
      placeholder: (context, url) => Container(
        color: Colors.transparent,
      ),
    );
  else
    throw MediaNotFoundError();
}

/// Extract the video from Media entity.
VideoPlayerController getVideoPlayerControllerFromMedia(Media media) {
  if (media.filePath.isPresent)
    return VideoPlayerController.file(File(media.filePath.value));
  else if (media.url.isPresent) {
    return VideoPlayerController.network(media.url.value);
  } else
    throw MediaNotFoundError();
}

/// Get user from auth bloc.
/// Sign out if current user is not available.
User getUser(BuildContext context) {
  final state = BlocProvider.of<AuthBloc>(context).state;
  if (state is UserAuthenticated) {
    return state.user;
  } else
    throw UserNotSignedInError();
}

/// Get random color shade of the whole app theme.
Color getRandomShade(int seed) {
  final hue = getColorNameFromColor(BASE_COLOR).getHue;
  return RandomColor(seed).randomColor(
    colorHue: ColorHue.custom(Range(hue, hue)),
    colorSaturation: ColorSaturation.highSaturation,
    colorBrightness: ColorBrightness.random,
  );
}

/// Get category color.
extension CategoryRandomColor on Category {
  Color getColor() => getRandomShade(this.title.hashCode);
}

/// Video tap function.
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

/// Sort technique by date published.
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

/// Generate profile avatar from full name.
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

/// Load user profile photo.
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

/// Get technique thumbnail image.
Widget getTechniqueThumbnail(Technique technique) {
  if (technique.thumbnail.isPresent)
    return FittedBox(
      fit: BoxFit.cover,
      child: getImageFromMedia(technique.thumbnail.value),
    );
  else
    return Container(
      padding: const EdgeInsets.all(20),
      color: BASE_COLOR,
      child: FittedBox(
        fit: BoxFit.contain,
        child: Image.asset(LOGO_LOCATION),
      ),
    );
}

/// Check if user has access to a technique.
bool hasAccessToTechnique(BuildContext context, Technique technique) {
  final productType = technique.productInfo.type;

  if (productType == ProductType.free)
    // Technique is for free.
    return true;
  else if (productType == ProductType.unavailable)
    // Technique not available at the moment.
    return false;
  else {
    final user = getUser(context);
    // Check if user purchased the technique in the past.
    return user.purchasedTechniques.contains(technique.id);
  }
}

/// Get technique price tag.
String getPriceTag(BuildContext context, Technique technique) {
  final l10n = AppLocalizations.of(context);
  final user = getUser(context);
  if (user.purchasedTechniques.contains(technique.id))
    return l10n.translate("Purchased");
  else
    return l10n.translate(technique.productInfo.toString());
}
