import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/theme_trent.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final themeTrent = watch<ThemeTrent>(context);
    final state = themeTrent.state;
    return Positioned(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Switch(
              value: state.themeMode == ThemeMode.dark,
              onChanged: (bool val) {
                themeTrent.switchTheme();
              },
              activeColor: ColorScheme.of(context).onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
