part of 'user_section_navigation_bloc.dart';

@immutable
class UserSectionNavigationState {
  final Widget body;
  final int bottomNavigatorIndex;
  final bool reversedTransition;

  UserSectionNavigationState({
    required this.body,
    required this.bottomNavigatorIndex,
    this.reversedTransition = false,
  });
}
