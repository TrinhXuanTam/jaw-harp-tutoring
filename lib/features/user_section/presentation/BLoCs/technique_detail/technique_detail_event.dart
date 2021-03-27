part of 'technique_detail_bloc.dart';

@immutable
abstract class TechniqueDetailEvent {}

class LoadTechniqueDetail extends TechniqueDetailEvent {
  final Technique technique;

  LoadTechniqueDetail(this.technique);
}

class MarkTechniqueAsFavoriteEvent extends TechniqueDetailEvent {
  final Technique technique;
  final User user;

  MarkTechniqueAsFavoriteEvent(this.technique, this.user);
}

class RemoveTechniqueFromFavoritesEvent extends TechniqueDetailEvent {
  final Technique technique;
  final User user;

  RemoveTechniqueFromFavoritesEvent(this.technique, this.user);
}
