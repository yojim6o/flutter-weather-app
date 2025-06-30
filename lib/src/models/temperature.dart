import 'package:weather_app/src/trents/states/unit_state.dart';

class Temperature {
  Temperature.metric(this.metric);

  factory Temperature.imperial(double imperial) =>
      Temperature.metric((imperial - 32) / 1.8);

  static double absoluteZero = 273.15;

  final double metric;
  double get imperial => (metric * 1.8) + 32;

  double onUnit(UnitMode u) {
    if (u == UnitMode.imperial) {
      return imperial;
    }
    return metric;
  }
}
