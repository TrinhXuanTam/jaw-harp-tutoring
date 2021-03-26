import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional_internal.dart';

class MediaDTO extends Media {
  MediaDTO({
    Optional<String> url = const Optional.empty(),
    Optional<String> filePath = const Optional.empty(),
  }) : super(url: url, filePath: filePath);

  factory MediaDTO.fromEntity(Media media) {
    return MediaDTO(url: media.url, filePath: media.filePath);
  }

  Map<String, dynamic> toJson() {
    return {
      if (url.isPresent) "url": url.value,
      if (filePath.isPresent) "filePath": filePath.value,
    };
  }

  factory MediaDTO.fromJson(Map<String, dynamic> json) {
    return MediaDTO(
      url: Optional<String>.ofNullable(json["url"]),
      filePath: Optional<String>.ofNullable(json["filePath"]),
    );
  }
}
