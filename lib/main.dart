import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/app.dart';

// ignore: constant_identifier_names

Future<void> main() async {
  //debugPaintSizeEnabled = true;
  // required when using any plugin. In our case, it's shared_preferences
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  runApp(App(sharedPreferences: sharedPreferences));
}
