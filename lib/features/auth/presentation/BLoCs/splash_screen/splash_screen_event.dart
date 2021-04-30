part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent {}

/// Indicates that splash screen has been displayed.
class SplashScreenDisplayedEvent extends SplashScreenEvent {
  final String languageCode;

  SplashScreenDisplayedEvent(this.languageCode);
}

/// Transition after splash screen.
class SplashScreenTransitionEvent extends SplashScreenEvent {}
