part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

/// Indicates that splash screen has been displayed
class SplashScreenDisplayedEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
