import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';
import 'package:weather_app/src/trents/unit_trent.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/utility/theme_switch.dart';
import 'package:weather_app/src/widgets/utility/unit_switch.dart';

class MainForecast extends StatelessWidget {
  final WeatherData data;

  const MainForecast({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    /* debugPrint(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage->MainForecast",
    ); */
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _CityLabel(data.city),
            Utils.getWeatherAnimation(data.mainCondition, data.isDay),
            _TemperatureLabel(data: data),
          ],
        ),
        const UnitSwitch(),
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
        Text(
          city?.toUpperCase() ?? 'N/A',
          style: TextTheme.of(
            context,
          ).titleLarge?.copyWith(fontFamily: GoogleFonts.oswald().fontFamily),
        ),
      ],
    );
  }
}

class _TemperatureLabel extends StatelessWidget {
  final WeatherData data;

  const _TemperatureLabel({required this.data});
  @override
  Widget build(BuildContext context) {
    final unitTrent = watch<UnitTrent>(context);
    final unitState = unitTrent.state;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${data.temp.onUnit(unitState.unitMode).round().toString()}º',
          style: TextTheme.of(context).displayMedium?.copyWith(
            fontFamily: GoogleFonts.oswald().fontFamily,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          '/${data.feelsLike.onUnit(unitState.unitMode).round().toString()}º',
          style: TextTheme.of(
            context,
          ).bodyLarge?.copyWith(fontFamily: GoogleFonts.oswald().fontFamily),
        ),
      ],
    );
  }
}
