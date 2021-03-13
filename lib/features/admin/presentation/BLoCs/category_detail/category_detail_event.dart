part of 'category_detail_bloc.dart';

@immutable
abstract class CategoryDetailEvent {}

class LoadData extends CategoryDetailEvent {
  final Category category;

  LoadData(this.category);
}
