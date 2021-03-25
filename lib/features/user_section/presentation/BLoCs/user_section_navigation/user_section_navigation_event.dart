part of 'user_section_navigation_bloc.dart';

@immutable
class UserSectionNavigationEvent {
  final Widget body;
  final int bottomNavigatorIndex;

  UserSectionNavigationEvent({
    required this.body,
    required this.bottomNavigatorIndex,
  });
}
