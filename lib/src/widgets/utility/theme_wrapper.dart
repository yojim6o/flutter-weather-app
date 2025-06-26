/* import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/themes/theme_cubit.dart';

class ThemeWrapper extends StatelessWidget {
  final Widget Function(ThemeData theme) builder;

  const ThemeWrapper({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, theme) {
        return builder(theme);
      },
    );
  }
}
 */
