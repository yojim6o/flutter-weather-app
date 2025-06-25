import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/provider.dart';
import 'package:weather_app/src/themes/themes.dart';
import 'package:weather_app/src/pages/location_listener_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      key: Key("value"),
      child: MaterialApp(
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: true,
        home: Scaffold(body: LocationListenerPage()),
      ),
    );
  }
}
