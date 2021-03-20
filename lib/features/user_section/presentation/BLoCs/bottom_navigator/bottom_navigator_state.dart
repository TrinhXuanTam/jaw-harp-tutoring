part of 'bottom_navigator_bloc.dart';

@immutable
abstract class BottomNavigatorState {
  final int index;
  final int prevIndex;
  final Widget child;

  BottomNavigatorState({required this.index, required this.prevIndex, required this.child});
}

class HomePageChosen extends BottomNavigatorState {
  HomePageChosen(int prevIndex) : super(index: 0, prevIndex: prevIndex, child: HomePage());
}

class DownloadsChosen extends BottomNavigatorState {
  DownloadsChosen(int prevIndex) : super(index: 1, prevIndex: prevIndex, child: Container());
}

class FavoritesChosen extends BottomNavigatorState {
  FavoritesChosen(int prevIndex) : super(index: 2, prevIndex: prevIndex, child: Container());
}

class ProfileSectionChosen extends BottomNavigatorState {
  ProfileSectionChosen(int prevIndex) : super(index: 3, prevIndex: prevIndex, child: AdminMenuScreen());
}
