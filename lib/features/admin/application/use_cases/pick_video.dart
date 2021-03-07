import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class PickVideo {
  Future<File?> call() async {
    final picker = ImagePicker();
    final video = await picker.getVideo(source: ImageSource.gallery);
    if (video == null) return null;
    return File(video.path);
  }
}
