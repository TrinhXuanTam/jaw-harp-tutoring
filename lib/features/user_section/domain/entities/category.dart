import 'package:equatable/equatable.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

/// Category entity that contains techniques.
class Category extends Equatable {
  /// Category identifier.
  final String id;

  /// Indicates if the category is visible to regular users.
  /// Is set to false, the category itself with its content will be hidden.
  final bool isVisible;

  /// List of technique IDs that belong to this category.
  final List<String> techniqueIds;

  /// An optional thumbnail which helps users to identify this category.
  final Optional<Media> thumbnail;

  /// The localized title of this category.
  final String title;

  /// The localized description of the category.
  /// The description should be brief.
  final String description;

  const Category({
    required this.id,
    required this.isVisible,
    this.thumbnail = const Optional.empty(),
    required this.techniqueIds,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [id, isVisible, techniqueIds, title, description];
}
