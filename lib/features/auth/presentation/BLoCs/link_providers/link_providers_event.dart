part of 'link_providers_bloc.dart';

@immutable
abstract class LinkProvidersEvent {}

class EmailAuthenticationEvent extends LinkProvidersEvent {}

class FacebookAuthenticationEvent extends LinkProvidersEvent {}

class GoogleAuthenticationEvent extends LinkProvidersEvent {}
