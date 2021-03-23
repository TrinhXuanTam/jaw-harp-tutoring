import 'package:equatable/equatable.dart';
import 'package:jews_harp/features/user_section/domain/entities/media.dart';
import 'package:optional/optional.dart';

class Category extends Equatable {
  final String id;
  final bool isVisible;
  final List<String> techniqueIds;
  final Optional<Media> thumbnail;
  final String title;
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
