import 'package:weather_app/src/trents/states/unit_state.dart';

const double windConversion = 2.23694;

class WindSpeed {
  WindSpeed.metric(this.metric);
  factory WindSpeed.farhenheit(double imperial) =>
      WindSpeed.metric(imperial / windConversion);

  final double metric;
  double get imperial => metric * windConversion;

  double onUnit(UnitMode u) {
    if (u == UnitMode.imperial) {
      return imperial;
    }
    return metric;
  }
}
