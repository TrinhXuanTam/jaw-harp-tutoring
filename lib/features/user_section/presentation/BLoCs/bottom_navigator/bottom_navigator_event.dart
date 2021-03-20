part of 'bottom_navigator_bloc.dart';

@immutable
abstract class BottomNavigatorEvent {}

class NavigationItemClicked extends BottomNavigatorEvent {
  final int index;

  NavigationItemClicked(this.index);
}
