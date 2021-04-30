part of 'category_detail_bloc.dart';

@immutable
abstract class CategoryDetailState {}

/// Initial state.
class CategoryDetailLoading extends CategoryDetailState {}

/// Category techniques have been loaded.
class CategoryDetailLoaded extends CategoryDetailState {
  final Category category;
  final List<Technique> techniques;

  CategoryDetailLoaded(this.category, this.techniques);
}
