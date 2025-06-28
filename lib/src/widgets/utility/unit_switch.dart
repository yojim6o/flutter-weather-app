import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/states/unit_state.dart';
import 'package:weather_app/src/trents/unit_trent.dart';

class UnitSwitch extends StatelessWidget {
  const UnitSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final unitTrent = watch<UnitTrent>(context);
    final state = unitTrent.state;
    return Positioned(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 48),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () => unitTrent.switchUnit(),
              icon:
                  state.unitMode == UnitMode.metric
                      ? Icon(HugeIcons.strokeRoundedCelsius)
                      : Icon(HugeIcons.strokeRoundedFahrenheit),
            ),
          ],
        ),
      ),
    );
  }
}
