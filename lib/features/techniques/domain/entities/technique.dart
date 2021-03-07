import 'package:equatable/equatable.dart';
import 'package:jews_harp/features/techniques/domain/entities/technique_localized_data.dart';

class Technique extends Equatable {
  final String id;
  final Map<String, TechniqueLocalizedData> localizedData;

  Technique(this.id, this.localizedData);

  @override
  List<Object> get props => [];
}
