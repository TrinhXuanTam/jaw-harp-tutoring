part of 'connectivity_bloc.dart';

@immutable
abstract class ConnectivityEvent {}

class CheckInternetConnection extends ConnectivityEvent {}
