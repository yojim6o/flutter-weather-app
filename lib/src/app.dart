import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/themes/app_theme.dart';
import 'package:weather_app/src/trents/theme_trent.dart';
import 'package:weather_app/src/pages/connection_status_listener_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPrint("Build App");
    return const AppView();
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPrint("Build App->AppView");
    final themeMode = watch<ThemeTrent>(context);
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode.state.themeMode,
      debugShowCheckedModeBanner: true,
      home: Builder(
        builder: (context) {
          //debugPrint("Build App->AppView->Builder");
          return Scaffold(body: const ConnectionStatusListenerPage());
        },
      ),
    );
  }
}
