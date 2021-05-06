import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/category_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/product_info_DTO.dart';
import 'package:jews_harp/features/user_section/infrastructure/DTO/technique_DTO.dart';

void main() {
  final id = "id";
  final title = "title";
  final description = "description";
  final accompanyingText = "accompanying text";
  final difficulty = TechniqueDifficulty.beginner;

  final categoryId = id;
  final techniqueIds = [id];
  final categoryIsVisible = true;
  final categoryTitle = "category title";
  final categoryDescription = "category description";

  final productInfo = ProductInfo(ProductType.free);

  test("[fromEntity] should return 'TechniqueDTO' when entity object is provided.", () async {
    final entity = Technique(
      id: id,
      title: title,
      category: Category(
        id: categoryId,
        techniqueIds: techniqueIds,
        title: categoryTitle,
        description: categoryDescription,
        isVisible: categoryIsVisible,
      ),
      difficulty: difficulty,
      productInfo: productInfo,
      description: description,
      accompanyingText: accompanyingText,
    );

    final res = TechniqueDTO.fromEntity(entity);

    expect(res.id, id);
    expect(res.title, title);
    expect(res.description, description);
    expect(res.accompanyingText, accompanyingText);
    expect(res.category.id, categoryId);
    expect(res.category.isVisible, categoryIsVisible);
    expect(res.category.techniqueIds, techniqueIds);
    expect(res.category.title, categoryTitle);
    expect(res.category.description, categoryDescription);
    expect(res.difficulty, difficulty);
    expect(res.productInfo.type, productInfo.type);
  });

  test("[toJson] should return json format map when invoked.", () async {
    final techniqueDTO = TechniqueDTO(
      id: id,
      title: title,
      category: CategoryDTO(
        id: categoryId,
        techniqueIds: techniqueIds,
        title: categoryTitle,
        description: categoryDescription,
        isVisible: categoryIsVisible,
      ),
      difficulty: difficulty,
      productInfo: ProductInfoDTO(productInfo.type),
      description: description,
      accompanyingText: accompanyingText,
    );

    final res = techniqueDTO.toJson();

    expect(res["id"], id);
    expect(res["title"], title);
    expect(res["description"], description);
    expect(res["accompanyingText"], accompanyingText);
    expect(res["difficulty"], difficulty.index);
    expect(res["category"]["id"], categoryId);
    expect(res["category"]["isVisible"], categoryIsVisible);
    expect(res["category"]["title"], categoryTitle);
    expect(res["category"]["description"], categoryDescription);
    expect(res["category"]["techniqueIds"], techniqueIds);
    expect(res["productInfo"]["type"], productInfo.type.index);
  });

  test("[fromJson] should return 'TechniqueDTO' when given a Map.", () async {
    final json = {
      "id": id,
      "title": title,
      "description": description,
      "accompanyingText": accompanyingText,
      "difficulty": difficulty.index,
      "category": {
        "id": categoryId,
        "isVisible": categoryIsVisible,
        "title": categoryTitle,
        "description": categoryDescription,
        "techniqueIds": techniqueIds,
      },
      "productInfo": {
        "type": productInfo.type.index,
      },
    };

    final res = TechniqueDTO.fromJson(json);

    expect(res.id, id);
    expect(res.title, title);
    expect(res.description, description);
    expect(res.accompanyingText, accompanyingText);
    expect(res.category.id, categoryId);
    expect(res.category.isVisible, categoryIsVisible);
    expect(res.category.techniqueIds, techniqueIds);
    expect(res.category.title, categoryTitle);
    expect(res.category.description, categoryDescription);
    expect(res.difficulty, difficulty);
    expect(res.productInfo.type, productInfo.type);
  });
}
