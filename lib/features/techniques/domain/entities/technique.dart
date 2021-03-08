import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

class Technique extends Equatable {
  final String id;
  final String categoryId;
  final TechniqueDifficulty difficulty;
  final File? thumbnail;
  final File? video;
  final Map<String, TechniqueLocalizedData> localizedData;

  Technique({
    required this.id,
    required this.categoryId,
    required this.difficulty,
    this.thumbnail,
    this.video,
    required this.localizedData,
  });

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
