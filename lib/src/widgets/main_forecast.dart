import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/bloc/theme_cubit.dart';
import 'package:weather_app/src/utils/utils.dart';

class MainForecast extends StatelessWidget {
  final WeatherModel weatherModel;

  const MainForecast({super.key, required this.weatherModel});

  @override
  Widget build(BuildContext context) {
    final firstForecastItem = weatherModel.forecastList.first;
    return Stack(
      children: [
        Column(
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
        ),
        _buildThemeSwitch(context),
      ],
    );
  }

  Positioned _buildThemeSwitch(BuildContext context) {
    return Positioned(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (BuildContext context, ThemeState state) {
                return Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (bool val) {
                    context.read<ThemeCubit>().switchTheme();
                  },
                  activeColor: ColorScheme.of(context).onPrimary,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCityLabel(BuildContext context, String? city) {
    return Column(
      children: [
        Icon(Icons.location_on, color: IconTheme.of(context).color),
        Text(city ?? 'N/A', style: TextTheme.of(context).titleLarge),
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
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(color: ColorScheme.of(context).secondary),
        ),
      ],
    );
  }
}
