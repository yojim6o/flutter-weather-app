import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/src/bloc/theme_cubit.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (BuildContext context, ThemeState state) {
                return Switch(
                  value: state.themeMode == ThemeMode.dark,
                  onChanged: (bool val) {
                    context.read<ThemeCubit>().switchTheme();
                  },
                  activeColor: ColorScheme.of(context).onPrimary,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
