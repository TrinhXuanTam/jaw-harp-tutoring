part of 'category_detail_bloc.dart';

@immutable
abstract class CategoryDetailState {}

class CategoryInitial extends CategoryDetailState {}

class Loading extends CategoryDetailState {}

class CategoryDetailLoaded extends CategoryDetailState {
  final Category category;
  final List<Technique> techniques;

  CategoryDetailLoaded(this.category, this.techniques);
}
