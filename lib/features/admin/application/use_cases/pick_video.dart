import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

/// Pick a video from the file system.
@LazySingleton(env: [Environment.prod, Environment.dev])
class PickVideo {
  Future<Media?> call() async {
    final picker = ImagePicker();
    // Pick video from gallery.
    final video = await picker.getVideo(source: ImageSource.gallery);
    if (video == null) return null;
    return Media(filePath: Optional.of(video.path));
  }
}
