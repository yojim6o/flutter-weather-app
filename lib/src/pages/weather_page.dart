import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/src/bloc/weather_controller.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/widgets/draggable_forecast.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';
import 'package:weather_app/src/widgets/main_forecast.dart';

const apiKey = "cc7ea74c6101f3d5ba6ee2b6e186b5be";

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = WeatherProvider.of(context);
    print(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage",
    );
    return StreamBuilder<WeatherModel>(
      stream: bloc.weatherStream,
      builder: (context, snapshot) {
        print(snapshot.toString());

        if (snapshot.hasError) {
          return const GenericError(
            animationName: "invalid_request",
            message: "Something went wrong while fetching weather data.",
          );
        }

        if (!snapshot.hasData) {
          return const LoadingSpin();
        }

        //debugPrint(s.weather!.forecastList.length.toString());
        return Stack(
          children: [
            MainForecast(weatherModel: snapshot.data!),
            DraggableForecast(weatherModel: snapshot.data!, bloc: bloc),
          ],
        );
      },
    );
  }
}
