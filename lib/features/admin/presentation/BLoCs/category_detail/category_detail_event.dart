part of 'category_detail_bloc.dart';

@immutable
abstract class CategoryDetailEvent {}

class LoadTechniques extends CategoryDetailEvent {
  final Category category;

  LoadTechniques(this.category);
}
