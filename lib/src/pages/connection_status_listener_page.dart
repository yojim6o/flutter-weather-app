import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/connection_cubit.dart';
import 'package:weather_app/src/bloc/states/connection_state.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';

class ConnectionStatusListenerPage extends StatelessWidget {
  //final locationController = Get.put(LocationController());
  //final weatherController = Get.put(WeatherController(), permanent: true);

  const ConnectionStatusListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Build App->AppView->Builder->ConnectionStatusListener");
    return BlocBuilder<ConnectionCubit, ConnectionStatus>(
      builder: (BuildContext context, ConnectionStatus state) {
        if (state is ConnectionLoading) {
          return const LoadingSpin();
        }

        if (state is LocationDisabled) {
          return const GenericError(
            animationName: "location_disabled",
            message: 'Location service is disabled',
          );
        }

        if (state is NetworkDisabled) {
          return const GenericError(
            animationName: "invalid_request",
            message: 'No internet connection',
          );
        }

        if (state is ConnectionLoaded) {
          return const WeatherPage();
        }

        return const Material();
      },
    );
  }
}
