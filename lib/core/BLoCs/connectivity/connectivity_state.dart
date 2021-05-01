part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityState {}

class ConnectivityInitial extends ConnectivityState {}

class NoInternetConnection extends ConnectivityState {}

class ConnectionAvailable extends ConnectivityState {}
