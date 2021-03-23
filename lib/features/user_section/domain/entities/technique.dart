import 'package:equatable/equatable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
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
  final String title;
  final String description;
  final String accompanyingText;

  const Technique({
    required this.id,
    this.datePublished = const Optional.empty(),
    this.productId = const Optional.empty(),
    required this.category,
    required this.difficulty,
    this.thumbnail = const Optional.empty(),
    this.video = const Optional.empty(),
    required this.title,
    required this.description,
    required this.accompanyingText,
  });

  @override
  List<Object> get props => [id, category, difficulty, title, description, accompanyingText];
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
