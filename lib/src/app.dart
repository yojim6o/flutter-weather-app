import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/bloc/status_provider.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/repository/theme_repository.dart';
import 'package:weather_app/src/themes/app_theme.dart';
import 'package:weather_app/src/bloc/theme_cubit.dart';
import 'package:weather_app/src/pages/connection_status_listener_page.dart';

class App extends StatelessWidget {
  const App({required this.themeRepository, super.key});

  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    print("Build App");
    return WeatherProvider(
      child: RepositoryProvider.value(
        value: themeRepository,
        child: BlocProvider<ThemeCubit>(
          create:
              (BuildContext context) =>
                  ThemeCubit(themeRepository: context.read<ThemeRepository>())
                    ..getCurrentTheme(),
          child: const AppView(),
        ),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build App->AppView");
    /* return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (BuildContext context, ThemeState state) { */
    final themeMode = context.select(
      (ThemeCubit cubit) => cubit.state.themeMode,
    );
    return GetMaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      debugShowCheckedModeBanner: true,
      home: Builder(
        builder: (context) {
          print("Build App->AppView->Builder");
          return StatusProvider(
            child: const Scaffold(body: const ConnectionStatusListenerPage()),
          );
        },
      ),
    );
    /*  },
    ); */
  }
}
