import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/repository/location_repository.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/trents/forecast_card_trent.dart';
import 'package:weather_app/src/trents/forecast_trent.dart';
import 'package:weather_app/src/trents/weather_trent.dart';
import 'package:weather_app/src/trents/states/weather_state.dart';
import 'package:weather_app/src/widgets/draggable_forecast.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/loading/loading_main_forecast.dart';
import 'package:weather_app/src/widgets/main_forecast.dart';

const apiKey = "cc7ea74c6101f3d5ba6ee2b6e186b5be";

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /* debugPrint(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage",
    ); */
    return watchMap<WeatherTrent, WeatherState>(context, (mapper) {
      mapper
        ..as<WeatherLoading>((state) => const LoadingMainForecast())
        ..as<WeatherError>(
          (state) => const GenericError(
            animationName: "invalid_request",
            message: "Something went wrong while fetching weather data.",
          ),
        )
        ..as<WeatherLoaded>(
          (state) => Stack(
            children: [
              MainForecast(data: state.data),
              TrentManager(
                trents: [
                  register(ForecastCardTrent()),
                  register(
                    ForecastTrent(
                      context.read<WeatherRepository>(),
                      context.read<LocationRepository>(),
                    ),
                  ),
                ],
                child: DraggableForecast(),
              ),
            ],
          ),
        )
        ..orElse((state) {
          debugPrint(state.toString());
          return const Text("No Data");
        });
    });
  }
}
