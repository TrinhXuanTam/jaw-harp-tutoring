import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jews_harp/core/errors/media_not_found_error.dart';
import 'package:jews_harp/features/techniques/domain/entities/media.dart';

Image getImageFromMedia(Media media) {
  if (media.filePath.isPresent)
    return Image.file(File(media.filePath.value));
  else if (media.url.isPresent)
    return Image.network(media.url.value);
  else
    throw MediaNotFoundError();
}
