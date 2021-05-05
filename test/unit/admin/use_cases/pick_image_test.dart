import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/features/admin/application/use_cases/pick_image.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

class SuccessPickImage extends PickImage {
  @override
  Future<Media?> get pickFromGallery async => Media(filePath: Optional.of("/downloads"));
}

class FailurePickImage extends PickImage {
  @override
  Future<Media?> get pickFromGallery async => null;
}

void main() {
  test("[PickImage] should return thumbnail when user picks an image in the gallery.", () async {
    final pickImage = SuccessPickImage();

    final thumbnail = (await pickImage())!;

    expect(thumbnail.url.isPresent, false);
    expect(thumbnail.filePath.isPresent, true);
    expect(thumbnail.filePath.value, "/downloads");
  });

  test("[PickImage] should return null when user closes the image gallery.", () async {
    final pickImage = FailurePickImage();

    final thumbnail = await pickImage();

    expect(thumbnail == null, true);
  });
}
