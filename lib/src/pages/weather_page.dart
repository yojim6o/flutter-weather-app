import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/forecast_cubit.dart';
import 'package:weather_app/src/bloc/weather_cubit.dart';
import 'package:weather_app/src/bloc/states/weather_state.dart';
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
    debugPrint(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage",
    );
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (BuildContext context, WeatherState state) {
        debugPrint(state.toString());

        if (state is WeatherError) {
          return const GenericError(
            animationName: "invalid_request",
            message: "Something went wrong while fetching weather data.",
          );
        }

        if (state is WeatherLoading) {
          return const LoadingSpin();
        }

        if (state is WeatherLoaded) {
          return Stack(
            children: [
              MainForecast(weatherModel: state.weather),
              BlocProvider<ForecastCubit>(
                create: (context) => ForecastCubit([]),
                child: DraggableForecast(
                  forecastMap: Utils.mapWeatherToForecastItems(state.weather),
                ),
              ),
            ],
          );
        }

        return Material();
      },
    );
  }
}
