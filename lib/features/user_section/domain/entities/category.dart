import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final bool isVisible;
  final List<String> techniqueIds;
  final String title;
  final String description;

  const Category({
    required this.id,
    required this.isVisible,
    required this.techniqueIds,
    required this.title,
    required this.description,
  });

  @override
  List<Object> get props => [id, isVisible, techniqueIds, title, description];
}
