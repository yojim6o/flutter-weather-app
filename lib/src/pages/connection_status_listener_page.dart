import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/src/bloc/status_controller.dart';
import 'package:weather_app/src/bloc/status_provider.dart';
import 'package:weather_app/src/bloc/weather_controller.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';

class ConnectionStatusListenerPage extends StatelessWidget {
  //final locationController = Get.put(LocationController());
  //final weatherController = Get.put(WeatherController(), permanent: true);

  const ConnectionStatusListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build App->AppView->Builder->ConnectionStatusListener");
    return StreamBuilder(
      stream: StatusProvider.of(context).connectionsAreOK,
      builder: (
        BuildContext context,
        AsyncSnapshot<ConnectionStatus> snapshot,
      ) {
        if (!snapshot.hasData) {
          return const LoadingSpin();
        }

        final data = snapshot.data!;

        if (data == ConnectionStatus.locationOff) {
          return const GenericError(
            animationName: "location_disabled",
            message: 'Location service is disabled',
          );
        }

        if (data == ConnectionStatus.internetOff) {
          return const GenericError(
            animationName: "invalid_request",
            message: 'No internet connection',
          );
        }

        return const WeatherPage();
      },
    );
  }
}
