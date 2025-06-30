import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/api/api.dart';
import 'package:weather_app/src/api/api.keys.dart';
import 'package:weather_app/src/repository/Unit_repository.dart';
import 'package:weather_app/src/repository/location_repository.dart';
import 'package:weather_app/src/repository/theme_repository.dart';
import 'package:weather_app/src/repository/weather_repository.dart';
import 'package:weather_app/src/themes/app_theme.dart';
import 'package:weather_app/src/trents/city_trent.dart';
import 'package:weather_app/src/trents/connection_trent.dart';
import 'package:weather_app/src/trents/forecast_card_trent.dart';
import 'package:weather_app/src/trents/forecast_trent.dart';
import 'package:weather_app/src/trents/master_weather_trent.dart';
import 'package:weather_app/src/trents/theme_trent.dart';
import 'package:weather_app/src/screens/connection_status_listener_screen.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/src/trents/unit_trent.dart';
import 'package:weather_app/src/trents/weather_trent.dart';

class App extends StatelessWidget {
  const App({super.key, required this.sharedPreferences});
  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    debugPrint("Build App");
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (context) {
            const apiKey = String.fromEnvironment(
              'API_KEY',
              defaultValue: APIKeys.openWeatherAPIKey,
            );
            return HttpWeatherRepository(
              api: OpenWeatherMapAPI(apiKey),
              client: http.Client(),
            );
          },
        ),
        RepositoryProvider(
          create: (context) {
            return ThemeRepository(sharedPreferences: sharedPreferences);
          },
        ),
        RepositoryProvider(create: (context) => LocationRepository()),
        RepositoryProvider(
          create: (context) {
            return UnitRepository(sharedPreferences: sharedPreferences);
          },
        ),
      ],
      child: Builder(
        builder: (context) {
          return TrentManager(
            trents: [
              register(ThemeTrent(context.read<ThemeRepository>())),
              register(UnitTrent(context.read<UnitRepository>())),
              register(ConnectionTrent()),
              register(CityTrent(context.read<LocationRepository>())),
              register(WeatherTrent(context.read<WeatherRepository>())),
              register(ForecastTrent(context.read<WeatherRepository>())),
              register(MasterWeatherTrent()),
              register(ForecastCardTrent()),
            ],
            child: AppView(),
          );
        },
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Build App->AppView");
    final themeMode = watch<ThemeTrent>(context);
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode.state.themeMode,
      debugShowCheckedModeBanner: true,
      home: Builder(
        builder: (context) {
          debugPrint("Build App->AppView->Builder");
          return Scaffold(body: const ConnectionStatusListenerScreen());
        },
      ),
    );
  }
}
