import 'package:flutter/material.dart';
import 'package:trent/trent.dart';

class ThemeState extends EquatableCopyable<ThemeState> {
  ThemeState({this.themeMode = ThemeMode.light}); // Default theme = light theme

  final ThemeMode themeMode;

  // `copyWith()` method allows us to emit brand new instance of ThemeState
  @override
  ThemeState copyWith({ThemeMode? themeMode}) =>
      ThemeState(themeMode: themeMode ?? this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}
