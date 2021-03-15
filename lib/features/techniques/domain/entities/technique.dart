import 'package:equatable/equatable.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';
import 'package:optional/optional.dart';

class Technique extends Equatable {
  final String id;
  final Optional<String> productId;
  final String categoryId;
  final TechniqueDifficulty difficulty;
  final Optional<String> thumbnailUrl;
  final Optional<String> videoUrl;
  final Map<String, TechniqueLocalizedData> localizedData;

  const Technique({
    required this.id,
    this.productId = const Optional.empty(),
    required this.categoryId,
    required this.difficulty,
    this.thumbnailUrl = const Optional.empty(),
    this.videoUrl = const Optional.empty(),
    required this.localizedData,
  });

  String getLocalizedTitle(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData[ENGLISH_CODE]!.title;

    return data.title;
  }

  String getLocalizedDescription(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData[ENGLISH_CODE]!.description;

    return data.description;
  }

  String getLocalizedAccompanyingText(String languageCode) {
    final data = localizedData[languageCode];

    if (data == null) return localizedData[ENGLISH_CODE]!.accompanyingText;

    return data.accompanyingText;
  }

  @override
  List<Object> get props => [id, categoryId, difficulty, localizedData];
}

enum TechniqueDifficulty {
  beginner,
  intermediate,
  advanced,
}

extension StringExtensions on TechniqueDifficulty {
  String _capitalize(String str) {
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }

  String get string {
    return _capitalize(this.toString().split(".").last);
  }
}
