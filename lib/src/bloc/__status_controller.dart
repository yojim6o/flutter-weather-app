/* import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';

class StatusController {
  final _locationController = BehaviorSubject<ServiceStatus>();
  final _internetController = BehaviorSubject<ConnectivityResult>();

  StatusController() {
    _init();
  }

  void _init() {
    _initialCheckLocation();
    _initialInternetConnection();
  }

  void _initialCheckLocation() async {
    try {
      bool currentStatus = await Geolocator.isLocationServiceEnabled();
      changeLocationStatus(
        currentStatus ? ServiceStatus.enabled : ServiceStatus.disabled,
      );

      Geolocator.getServiceStatusStream().listen(
        (ServiceStatus serviceStatus) => changeLocationStatus(serviceStatus),
      );
    } catch (e) {
      debugPrint('InternetController: Error during internet status check. $e');
    }
  }

  void _initialInternetConnection() async {
    final connectivity = Connectivity();
    try {
      final result = await connectivity.checkConnectivity();
      changeInternetStatus(result.first);

      connectivity.onConnectivityChanged.listen(
        (cr) => changeInternetStatus(cr[0]),
      );
    } catch (e) {
      debugPrint('LocationController: Error during location status check. $e');
    }
  }

  Function(ServiceStatus) get changeLocationStatus =>
      _locationController.sink.add;
  Stream<ServiceStatus> get location => _locationController.stream;

  Function(ConnectivityResult) get changeInternetStatus =>
      _internetController.sink.add;
  Stream<ConnectivityResult> get internet => _internetController.stream;

  Stream<ConnectionStatus> get connectionsAreOK =>
      Rx.combineLatest2(location, internet, (l, i) {
        if (l == ServiceStatus.disabled) return ConnectionStatus.locationOff;
        if (i == ConnectivityResult.none) return ConnectionStatus.internetOff;
        return ConnectionStatus.ok;
      }).distinct();

  final serviceStatusValidator =
      StreamTransformer<ServiceStatus, ServiceStatus>.fromHandlers(
        handleData: (ServiceStatus data, EventSink<ServiceStatus> sink) {
          if (data == ServiceStatus.disabled) {
            sink.addError("Location is disabled");
            return;
          }
          sink.add(data);
        },
      );

  final connectivityResultValidator =
      StreamTransformer<ConnectivityResult, ConnectivityResult>.fromHandlers(
        handleData: (
          ConnectivityResult data,
          EventSink<ConnectivityResult> sink,
        ) {
          if (data == ConnectivityResult.none) {
            sink.addError("Location is disabled");
            return;
          }
          sink.add(data);
        },
      );
}

enum ConnectionSta { locationOff, internetOff, ok }
 */
