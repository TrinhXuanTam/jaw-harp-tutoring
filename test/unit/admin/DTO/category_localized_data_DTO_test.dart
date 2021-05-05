import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/features/admin/domain/domain/category_localized_data.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/category_localized_data_DTO.dart';
import 'package:mocktail/mocktail.dart';

class DocumentMock extends Mock implements DocumentSnapshot {}

void main() {
  var categoryDoc;

  final String titleEng = "title";
  final String titleCze = "název";
  final String descriptionEng = "description";
  final String descriptionCze = "popisek";

  final entity = CategoryLocalizedData(
    languageCode: ENGLISH_CODE,
    title: titleEng,
    description: descriptionEng,
  );

  // Reset mock objects before each test.
  setUp(() {
    categoryDoc = DocumentMock();
  });

  test("[fromEntity] should return 'CategoryLocalizedDataDTO' when entity object is provided.", () async {
    final categoryLocalizedDataDTO = CategoryLocalizedDataDTO.fromEntity(entity);

    expect(categoryLocalizedDataDTO.languageCode, ENGLISH_CODE);
    expect(categoryLocalizedDataDTO.title, titleEng);
    expect(categoryLocalizedDataDTO.description, descriptionEng);
  });

  test("[getLocalizedData] should return map of 'CategoryLocalizedDataDTO' when Firestore document is provided.", () async {
    final rawData = {
      ENGLISH_CODE: {
        "title": titleEng,
        "description": descriptionEng,
      },
      CZECH_CODE: {
        "title": titleCze,
        "description": descriptionCze,
      }
    };
    when(() => categoryDoc["localization"]).thenReturn(rawData);

    final res = CategoryLocalizedDataDTO.getLocalizedData(categoryDoc);
    final engLocalization = res[ENGLISH_CODE]!;
    final czeLocalization = res[CZECH_CODE]!;

    expect(res.length, rawData.keys.length);
    expect(engLocalization.title, titleEng);
    expect(engLocalization.description, descriptionEng);
    expect(czeLocalization.title, titleCze);
    expect(czeLocalization.description, descriptionCze);
  });
}
