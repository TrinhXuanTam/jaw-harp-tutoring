part of 'third_party_auth_bloc.dart';

@immutable
abstract class ThirdPartyAuthState {}

class ThirdPartyAuthInitial extends ThirdPartyAuthState {}

class ThirdPartyAuthSuccessState extends ThirdPartyAuthState {
  final User user;

  ThirdPartyAuthSuccessState(this.user);
}
