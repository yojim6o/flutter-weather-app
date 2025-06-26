import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/connection_cubit.dart';
import 'package:weather_app/src/bloc/weather_cubit.dart';
import 'package:weather_app/src/repository/theme_repository.dart';
import 'package:weather_app/src/themes/app_theme.dart';
import 'package:weather_app/src/bloc/theme_cubit.dart';
import 'package:weather_app/src/pages/connection_status_listener_page.dart';

class App extends StatelessWidget {
  const App({required this.themeRepository, super.key});

  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    debugPrint("Build App");
    return RepositoryProvider.value(
      value: themeRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeCubit>(
            create:
                (BuildContext context) =>
                    ThemeCubit(themeRepository: context.read<ThemeRepository>())
                      ..getCurrentTheme(),
          ),
          BlocProvider<WeatherCubit>(
            create:
                (BuildContext context) => WeatherCubit()..fetchWeatherInfo(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint("Build App->AppView");
    final themeMode = context.select(
      (ThemeCubit cubit) => cubit.state.themeMode,
    );
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: true,
      home: Builder(
        builder: (context) {
          debugPrint("Build App->AppView->Builder");
          return BlocProvider<ConnectionCubit>(
            create: (context) => ConnectionCubit(),
            child: const Scaffold(body: ConnectionStatusListenerPage()),
          );
        },
      ),
    );
  }
}
