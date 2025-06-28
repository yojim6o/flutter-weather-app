import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
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
            IconButton(
              onPressed: () => themeTrent.switchTheme(),
              icon:
                  state.themeMode == ThemeMode.dark
                      ? Icon(Icons.brightness_4)
                      : Icon(HugeIcons.strokeRoundedMoon02),
            ),
          ],
        ),
      ),
    );
  }
}
