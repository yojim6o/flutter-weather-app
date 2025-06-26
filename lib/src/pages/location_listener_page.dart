import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/src/bloc/status_controller.dart';
import 'package:weather_app/src/bloc/status_provider.dart';
import 'package:weather_app/src/bloc/weather_controller.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';

class LocationListenerPage extends StatelessWidget {
  //final locationController = Get.put(LocationController());
  final weatherController = Get.lazyPut(() => WeatherController());

  LocationListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: StatusProvider.of(context).connectionsAreOK,
      builder: (
        BuildContext context,
        AsyncSnapshot<ConnectionStatus> snapshot,
      ) {
        if (!snapshot.hasData) {
          return LoadingSpin();
        }

        final data = snapshot.data!;

        if (data == ConnectionStatus.locationOff) {
          return GenericError(
            animationName: "location_disabled",
            message: 'Location service is disabled',
          );
        }

        if (data == ConnectionStatus.internetOff) {
          return GenericError(
            animationName: "invalid_request",
            message: 'No internet connection',
          );
        }

        return WeatherPage();
      },
    );
  }
}
