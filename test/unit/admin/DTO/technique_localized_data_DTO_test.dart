import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/features/admin/domain/domain/technique_localized_data.dart';
import 'package:jews_harp/features/admin/infrastructure/DTO/technique_localized_data_DTO.dart';
import 'package:mocktail/mocktail.dart';

class DocumentMock extends Mock implements DocumentSnapshot {}

void main() {
  var techniqueDoc;

  final String titleEng = "title";
  final String titleCze = "název";
  final String descriptionEng = "description";
  final String descriptionCze = "popisek";
  final String accompanyingTextEng = "accompanying text";
  final String accompanyingTextCze = "doprovodný text";

  final entity = TechniqueLocalizedData(languageCode: ENGLISH_CODE, title: titleEng, description: descriptionEng, accompanyingText: accompanyingTextEng);

  // Reset mock objects before each test.
  setUp(() {
    techniqueDoc = DocumentMock();
  });

  test("[fromEntity] should return 'TechniqueLocalizedDataDTO' when entity object is provided.", () async {
    final categoryLocalizedDataDTO = TechniqueLocalizedDataDTO.fromEntity(entity);

    expect(categoryLocalizedDataDTO.languageCode, ENGLISH_CODE);
    expect(categoryLocalizedDataDTO.title, titleEng);
    expect(categoryLocalizedDataDTO.description, descriptionEng);
    expect(categoryLocalizedDataDTO.accompanyingText, accompanyingTextEng);
  });

  test("[getLocalizedData] should return map of 'TechniqueLocalizedDataDTO' when Firestore document is provided.", () async {
    final rawData = {
      ENGLISH_CODE: {
        "title": titleEng,
        "description": descriptionEng,
        "accompanyingText": accompanyingTextEng,
      },
      CZECH_CODE: {
        "title": titleCze,
        "description": descriptionCze,
        "accompanyingText": accompanyingTextCze,
      }
    };
    when(() => techniqueDoc["localization"]).thenReturn(rawData);

    final res = TechniqueLocalizedDataDTO.getLocalizedData(techniqueDoc);
    final engLocalization = res[ENGLISH_CODE]!;
    final czeLocalization = res[CZECH_CODE]!;

    expect(res.length, rawData.keys.length);
    expect(engLocalization.title, titleEng);
    expect(engLocalization.description, descriptionEng);
    expect(engLocalization.accompanyingText, accompanyingTextEng);
    expect(czeLocalization.title, titleCze);
    expect(czeLocalization.description, descriptionCze);
    expect(czeLocalization.accompanyingText, accompanyingTextCze);
  });
}
