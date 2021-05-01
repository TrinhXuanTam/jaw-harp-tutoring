import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'connectivity_event.dart';

part 'connectivity_state.dart';

/// Global internet connection state
@LazySingleton(env: [Environment.prod, Environment.dev])
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(ConnectivityInitial());

  @override
  Stream<ConnectivityState> mapEventToState(
    ConnectivityEvent event,
  ) async* {
    final connectivity = Connectivity();

    if (state is ConnectivityInitial) {
      connectivity.onConnectivityChanged.listen((_) => this.add(CheckInternetConnection()));
    }

    if (event is CheckInternetConnection) {
      final connectivityResult = await connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        yield NoInternetConnection();
      } else
        yield ConnectionAvailable();
    }
  }
}
