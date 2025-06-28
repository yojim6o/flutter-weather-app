import 'dart:async';
import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/repository/theme_repository.dart';
import 'package:weather_app/src/trents/states/theme_state.dart';

class ThemeTrent extends Trent<ThemeState> {
  ThemeTrent(ThemePersistence themeRepository)
    : _themeRepository = themeRepository,
      super(ThemeState()) {
    _startListening();
  }

  final ThemePersistence _themeRepository;
  late StreamSubscription<CustomTheme> _themeSubscription;
  // used to determine if the current theme is dark
  static late bool _isDarkTheme;

  void _startListening() {
    // Since `getTheme()` returns a stream, we listen to the output
    _themeSubscription = _themeRepository.getTheme().listen((customTheme) {
      if (customTheme.name == CustomTheme.light.name) {
        // Since, `customTheme` is light, we set `_isDarkTheme` to false
        _isDarkTheme = false;
        emit(state.copyWith(themeMode: ThemeMode.light));
      } else {
        // Since, `customTheme` is dark, we set `_isDarkTheme` to true
        _isDarkTheme = true;
        emit(state.copyWith(themeMode: ThemeMode.dark));
      }
    });
  }

  void switchTheme() {
    if (_isDarkTheme) {
      // Since, currentTheme is dark, after switching we want light theme to
      // be persisted.
      _themeRepository.saveTheme(CustomTheme.light);
    } else {
      // Since, currentTheme is light, after switching we want dark theme to
      // be persisted.
      _themeRepository.saveTheme(CustomTheme.dark);
    }
  }

  close() {
    _themeSubscription.cancel();
    _themeRepository.dispose();
    dispose();
  }
}
