import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/mediaDTO.dart';
import 'package:optional/optional.dart';

void main() {
  final url = "wwww.google.com";
  final filePath = "/downloads";

  test("[fromEntity] should return 'MediaDTO' when entity object is provided.", () async {
    final entity = Media(
      url: Optional.of(url),
      filePath: Optional.of(filePath),
    );

    final res = MediaDTO.fromEntity(entity);

    expect(res.url.isPresent, true);
    expect(res.filePath.isPresent, true);
    expect(res.url.value, url);
    expect(res.filePath.value, filePath);
  });

  test("[toJson] should return json format map when invoked.", () async {
    final mediaDTO1 = MediaDTO(url: Optional.empty(), filePath: Optional.of(filePath));
    final mediaDTO2 = MediaDTO(url: Optional.of(url), filePath: Optional.empty());
    final mediaDTO3 = MediaDTO(url: Optional.empty(), filePath: Optional.empty());

    final res1 = mediaDTO1.toJson();
    final res2 = mediaDTO2.toJson();
    final res3 = mediaDTO3.toJson();

    expect(res1["url"] == null, true);
    expect(res1["filePath"], filePath);
    expect(res2["url"], url);
    expect(res2["filePath"] == null, true);
    expect(res3["url"] == null, true);
    expect(res3["filePath"] == null, true);
  });

  test("[fromJson] should return 'MediaDTO' when given a Map.", () async {
    final json1 = {"url": url};
    final json2 = {"filePath": filePath};
    final json3 = {"url": url, "filePath": filePath};

    final res1 = MediaDTO.fromJson(json1);
    final res2 = MediaDTO.fromJson(json2);
    final res3 = MediaDTO.fromJson(json3);

    expect(res1.filePath.isPresent, false);
    expect(res1.url.isPresent, true);
    expect(res1.url.value, url);
    expect(res2.filePath.isPresent, true);
    expect(res2.url.isPresent, false);
    expect(res2.filePath.value, filePath);
    expect(res3.filePath.isPresent, true);
    expect(res3.url.isPresent, true);
    expect(res3.url.value, url);
    expect(res3.filePath.value, filePath);
  });
}
