part of 'technique_detail_bloc.dart';

@immutable
abstract class TechniqueDetailEvent {}

class LoadTechniqueDetail extends TechniqueDetailEvent {
  final Technique technique;

  LoadTechniqueDetail(this.technique);
}
