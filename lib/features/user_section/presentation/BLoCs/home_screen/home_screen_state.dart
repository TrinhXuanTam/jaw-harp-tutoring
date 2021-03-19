part of 'home_screen_bloc.dart';

@immutable
abstract class HomeScreenState {
  final Category? category;

  HomeScreenState({this.category});
}

class HomeScreenLoading extends HomeScreenState {
  HomeScreenLoading({Category? category}) : super(category: category);
}
