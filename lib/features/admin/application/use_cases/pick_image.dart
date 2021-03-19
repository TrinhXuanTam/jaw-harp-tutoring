
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

@LazySingleton(env: [Environment.prod, Environment.dev])
class PickImage {
  Future<Media?> call() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    if (image == null) return null;
    return Media(filePath: Optional.of(image.path));
  }
}
