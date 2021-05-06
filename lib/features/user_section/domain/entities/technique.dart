import 'package:equatable/equatable.dart';
import 'package:jews_harp/features/user_section/domain/entities/category.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:jews_harp/features/user_section/domain/entities/product_info.dart';
import 'package:optional/optional.dart';

/// Technique (lecture) entity.
class Technique extends Equatable {
  /// Technique identifier.
  final String id;

  /// Date when was this technique released to the public.
  final Optional<DateTime> datePublished;

  /// Product identifier to enable payments.
  final Optional<String> productId;

  /// Product type of this technique.
  /// Can be free, paid or unavailable.
  final ProductInfo productInfo;

  /// The category of this technique.
  final Category category;

  /// The difficulty of this technique.
  /// Can be either beginner, intermediate or advanced.
  final TechniqueDifficulty difficulty;

  /// Optional thumbnail to help user identify the technique.
  final Optional<Media> thumbnail;

  /// Optional video lecture of the technique.
  final Optional<Media> video;

  /// Localized title.
  final String title;

  /// Localized brief description.
  final String description;

  /// Localized accompanying text to the video.
  final String accompanyingText;

  const Technique({
    required this.id,
    this.video = const Optional.empty(),
    this.thumbnail = const Optional.empty(),
    this.productId = const Optional.empty(),
    this.datePublished = const Optional.empty(),
    required this.title,
    required this.category,
    required this.difficulty,
    required this.productInfo,
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

/// Convert technique difficulty enum to string.
extension StringExtensions on TechniqueDifficulty {
  String _capitalize(String str) {
    return "${str[0].toUpperCase()}${str.substring(1)}";
  }

  String get string {
    return _capitalize(this.toString().split(".").last);
  }
}
