part of 'third_party_auth_bloc.dart';

@immutable
abstract class ThirdPartyAuthEvent {}

class FacebookAuthEvent extends ThirdPartyAuthEvent {}

class GoogleAuthEvent extends ThirdPartyAuthEvent {}