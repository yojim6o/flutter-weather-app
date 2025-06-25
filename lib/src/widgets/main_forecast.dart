import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/utils/utils.dart';

class MainForecast extends StatelessWidget {
  final WeatherModel weatherModel;

  const MainForecast({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final firstForecastItem = weatherModel.forecastList.removeAt(0);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCityLabel(context, weatherModel.cityName),
        Lottie.asset(
          Utils.getWeatherAnimation(
            firstForecastItem.mainCondition,
            firstForecastItem.isDay,
          ),
        ),
        _buildTemperatureLabel(weatherModel, context),
      ],
    );
  }

  Widget _buildCityLabel(BuildContext context, String? city) {
    return Column(
      children: [
        Icon(Icons.location_on, color: Theme.of(context).colorScheme.primary),
        Text(city ?? 'N/A', style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }

  Widget _buildTemperatureLabel(
    WeatherModel weatherModel,
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weatherModel.forecastList[0].temperature.round()}º',
          style: TextTheme.of(context).displayMedium,
        ),
        Text(
          '/${weatherModel.forecastList[0].feelsLike.round()}º',
          style: TextStyle(
            fontSize: 20,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
