import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/app.dart';
import 'package:weather_app/src/repository/theme_repository.dart';

// ignore: constant_identifier_names
const API_KEY = "cc7ea74c6101f3d5ba6ee2b6e186b5be";

Future<void> main() async {
  //debugPaintSizeEnabled = true;
  // required when using any plugin. In our case, it's shared_preferences
  WidgetsFlutterBinding.ensureInitialized();

  // Creating an instance of ThemeRepository that will invoke the _init() method
  // and populate the stream controller in the repository.
  final themeRepository = ThemeRepository(
    sharedPreferences: await SharedPreferences.getInstance(),
  );

  runApp(App(themeRepository: themeRepository));
}
