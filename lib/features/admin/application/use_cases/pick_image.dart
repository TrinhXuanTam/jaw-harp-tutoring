import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class PickImage {
  Future<File?> call() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  }
}
