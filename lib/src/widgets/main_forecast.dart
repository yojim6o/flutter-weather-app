import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/utility/theme_switch.dart';

class MainForecast extends StatelessWidget {
  final WeatherModel weatherModel;

  const MainForecast({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    print(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage->MainForecast",
    );
    final firstForecastItem = weatherModel.forecastList.first;
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CityLabel(weatherModel.cityName),
            Lottie.asset(
              Utils.getWeatherAnimation(
                firstForecastItem.mainCondition,
                firstForecastItem.isDay,
              ),
            ),
            _TemperatureLabel(weatherModel: weatherModel),
          ],
        ),
        const ThemeSwitch(),
      ],
    );
  }
}

class _CityLabel extends StatelessWidget {
  final String? city;

  const _CityLabel(this.city);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.location_on, color: IconTheme.of(context).color),
        Text(city ?? 'N/A', style: TextTheme.of(context).titleLarge),
      ],
    );
  }
}

class _TemperatureLabel extends StatelessWidget {
  final WeatherModel weatherModel;

  const _TemperatureLabel({required this.weatherModel});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weatherModel.forecastList[0].temperature.round()}º',
          style: TextTheme.of(context).displayMedium,
        ),
        Text(
          '/${weatherModel.forecastList[0].feelsLike.round()}º',
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(color: ColorScheme.of(context).secondary),
        ),
      ],
    );
  }
}
