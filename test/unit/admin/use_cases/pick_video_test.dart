import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/features/admin/application/use_cases/pick_video.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

class SuccessPickVideo extends PickVideo {
  @override
  Future<Media?> get pickFromGallery async => Media(filePath: Optional.of("/downloads"));
}

class FailurePickVideo extends PickVideo {
  @override
  Future<Media?> get pickFromGallery async => null;
}

void main() {
  test("[PickVideo] should return video when user picks an video in the gallery.", () async {
    final pickVideo = SuccessPickVideo();

    final video = (await pickVideo())!;

    expect(video.url.isPresent, false);
    expect(video.filePath.isPresent, true);
    expect(video.filePath.value, "/downloads");
  });

  test("[PickImage] should return null when user closes the video gallery.", () async {
    final pickVideo = FailurePickVideo();

    final video = await pickVideo();

    expect(video == null, true);
  });
}
