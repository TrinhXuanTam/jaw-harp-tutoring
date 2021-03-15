import 'package:jews_harp/features/techniques/domain/entities/media.dart';
import 'package:optional/optional_internal.dart';

class MediaDTO extends Media {
  MediaDTO({
    Optional<String> url = const Optional.empty(),
    Optional<String> filePath = const Optional.empty(),
  }) : super(url: url, filePath: filePath);

  factory MediaDTO.fromEntity(Media media) {
    return MediaDTO(url: media.url, filePath: media.filePath);
  }
}
