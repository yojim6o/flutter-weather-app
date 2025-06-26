part of '../bloc/theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState({
    this.themeMode = ThemeMode.light,
  }); // Default theme = light theme

  final ThemeMode themeMode;

  // `copyWith()` method allows us to emit brand new instance of ThemeState
  ThemeState copyWith({ThemeMode? themeMode}) =>
      ThemeState(themeMode: themeMode ?? this.themeMode);

  @override
  List<Object?> get props => [themeMode];
}
