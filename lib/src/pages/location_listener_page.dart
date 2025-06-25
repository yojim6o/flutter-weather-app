import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/location_disabled_error.dart';

class LocationListenerPage extends StatelessWidget {
  final StreamController<bool> _serviceStatusController =
      StreamController<bool>();
  late final Stream<bool> _serviceStatusStream;

  LocationListenerPage({super.key});

  void initState() async {
    _serviceStatusStream = _serviceStatusController.stream.asBroadcastStream();
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    _serviceStatusController.sink.add(isServiceEnabled);

    Geolocator.getServiceStatusStream().listen((ServiceStatus serviceStatus) {
      _serviceStatusController.sink.add(serviceStatus == ServiceStatus.enabled);
    });
  }

  @override
  Widget build(BuildContext context) {
    initState();
    return StreamBuilder<bool>(
      stream: _serviceStatusStream,
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return SpinKitSpinningLines(
            color: Theme.of(context).colorScheme.primary,
          );
        }

        if (!snapshot.data!) {
          return LocationDisabledError();
        }

        return WeatherPage();
      },
    );
  }
}
