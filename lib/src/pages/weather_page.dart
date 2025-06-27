import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/forecast_trent.dart';
import 'package:weather_app/src/trents/weather_trent.dart';
import 'package:weather_app/src/trents/states/weather_state.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/draggable_forecast.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';
import 'package:weather_app/src/widgets/main_forecast.dart';

const apiKey = "cc7ea74c6101f3d5ba6ee2b6e186b5be";

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    /* debugPrint(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage",
    ); */
    return watchMap<WeatherTrent, WeatherState>(context, (mapper) {
      mapper
        ..as<WeatherLoading>((state) => const LoadingSpin())
        ..as<WeatherError>(
          (state) => const GenericError(
            animationName: "invalid_request",
            message: "Something went wrong while fetching weather data.",
          ),
        )
        ..as<WeatherLoaded>(
          (state) => Stack(
            children: [
              MainForecast(weatherModel: state.weather),
              TrentManager(
                trents: [register(ForecastTrent())],
                child: DraggableForecast(
                  forecastMap: Utils.mapWeatherToForecastItems(state.weather),
                ),
              ),
            ],
          ),
        )
        ..orElse((state) {
          //debugPrint(state.toString());
          return const Text("No Datu");
        });
    });
  }
}
