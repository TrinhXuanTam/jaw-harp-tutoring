import 'package:equatable/equatable.dart';
import 'package:jews_harp/core/constants/language_codes.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/technique_localized_data.dart';
import 'package:optional/optional.dart';

import 'media.dart';

class Technique extends Equatable {
  final String id;
  final Optional<DateTime> datePublished;
  final Optional<String> productId;
  final Category category;
  final TechniqueDifficulty difficulty;
  final Optional<Media> thumbnail;
  final Optional<Media> video;
  final Map<String, TechniqueLocalizedData> localizedData;

  const Technique({
    required this.id,
    this.datePublished = const Optional.empty(),
    this.productId = const Optional.empty(),
    required this.category,
    required this.difficulty,
    this.thumbnail = const Optional.empty(),
    this.video = const Optional.empty(),
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
  List<Object> get props => [id, category, difficulty, localizedData];
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
