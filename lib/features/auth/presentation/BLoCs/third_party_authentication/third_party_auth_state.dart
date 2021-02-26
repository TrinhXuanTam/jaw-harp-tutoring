part of 'third_party_auth_bloc.dart';

@immutable
abstract class ThirdPartyAuthState {}

class ThirdPartyAuthInitial extends ThirdPartyAuthState {}

class ThirdPartyAuthSuccessState extends ThirdPartyAuthState {
  final User user;

  ThirdPartyAuthSuccessState(this.user);
}

/// Multiple providers are found
class MultipleProvidersState extends ThirdPartyAuthState {
  final String email;
  final Set<String> providers;

  MultipleProvidersState(this.email, this.providers);
}
