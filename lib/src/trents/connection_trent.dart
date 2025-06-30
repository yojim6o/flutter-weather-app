import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/states/connection_state.dart';

class ConnectionTrent extends Trent<ConnectionStatus> {
  // ignore: unused_field
  late final StreamSubscription _subscription;

  ConnectionTrent() : super(ConnectionLoading()) {
    _startListening();
  }

  void _startListening() async {
    final connectivity = Connectivity();
    final locationStatus =
        await Geolocator.isLocationServiceEnabled()
            ? ServiceStatus.enabled
            : ServiceStatus.disabled;
    final networkConnectivity = await connectivity.checkConnectivity();

    _subscription = Rx.combineLatest2<
      ServiceStatus,
      List<ConnectivityResult>,
      ConnectionStatus
    >(
      Geolocator.getServiceStatusStream().startWith(locationStatus),
      connectivity.onConnectivityChanged.startWith(networkConnectivity),
      (ServiceStatus location, List<ConnectivityResult> internet) {
        if (location == ServiceStatus.disabled) {
          return LocationDisabled();
        }
        if (internet.first == ConnectivityResult.none) {
          return NetworkDisabled();
        }
        return ConnectionLoaded(
          serviceStatus: location,
          connectivityResult: internet,
        );
      },
    ).listen(
      (state) => emit(state),
      onError: (e) => emit(ConnectionError("Error: $e")),
    );
  }
}
