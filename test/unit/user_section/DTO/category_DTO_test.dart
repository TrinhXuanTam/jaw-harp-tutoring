import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';

void main() {
  final id = "id";
  final isVisible = true;
  final techniqueIds = ["technique1", "technique2"];
  final title = "title";
  final description = "description";

  test("[fromEntity] should return 'CategoryDTO' when entity object is provided.", () async {
    final entity = Category(
      id: id,
      isVisible: isVisible,
      techniqueIds: techniqueIds,
      title: title,
      description: description,
    );

    final res = CategoryDTO.fromEntity(entity);

    expect(res.id, id);
    expect(res.isVisible, isVisible);
    expect(res.techniqueIds, techniqueIds);
    expect(res.title, title);
    expect(res.description, description);
  });

  test("[toJson] should return json format map when invoked.", () async {
    final categoryDTO = CategoryDTO(
      id: id,
      isVisible: isVisible,
      techniqueIds: techniqueIds,
      title: title,
      description: description,
    );

    final res = categoryDTO.toJson();

    expect(res["id"], id);
    expect(res["isVisible"], true);
    expect(res["techniqueIds"], techniqueIds);
    expect(res["title"], title);
    expect(res["description"], description);
  });

  test("[fromJson] should return 'CategoryDTO' when given a Map.", () async {
    final json = {
      "id": id,
      "isVisible": isVisible,
      "techniqueIds": techniqueIds,
      "title": title,
      "description": description,
    };

    final res = CategoryDTO.fromJson(json);

    expect(res.id, id);
    expect(res.isVisible, isVisible);
    expect(res.techniqueIds, techniqueIds);
    expect(res.title, title);
    expect(res.description, description);
  });
}
