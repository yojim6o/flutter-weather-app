import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/utility/my_virtual_divider.dart';

class ForecastCard extends StatelessWidget {
  final ForecastItem forecast;
  const ForecastCard(this.forecast, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _header(context),
        Card(
          child: Padding(
            padding: EdgeInsetsGeometry.fromLTRB(16, 0, 16, 16),
            child: Column(
              spacing: 8,
              children: [
                _animationRow(context),
                _descriptionRow(),
                _tableRow(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 16, top: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          Text(
            'Hourly Forecast',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }

  Widget _animationRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Lottie.asset(
            Utils.getWeatherAnimation(forecast.mainCondition, forecast.isDay),
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Column(
              children: [
                Text(DateFormat('yyyy-MM-dd').format(forecast.dt)),
                Text(
                  "${forecast.dt.hour}h",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _descriptionRow() {
    return Center(child: Text(forecast.secondaryCondition));
  }

  Widget _tableRow(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [..._toDetailList()],
      ),
    );
  }

  List<Widget> _toDetailList() {
    final List<Widget> result = [];
    result.add(MyVirtualDivider(Color(0xFF4285F4)));
    result.add(
      _columnInfo(
        HugeIcons.strokeRoundedTemperature,
        '${forecast.temperature.round()}',
        'º',
      ),
    );
    result.add(MyVirtualDivider(Color(0xFFEA4335)));
    result.add(
      _columnInfo(
        HugeIcons.strokeRoundedFastWind,
        '${forecast.wind.round()}',
        'm/s',
      ),
    );
    result.add(MyVirtualDivider(Color(0xFFFBBC05)));
    result.add(
      _columnInfo(
        HugeIcons.strokeRoundedHumidity,
        '${forecast.humidity.round()}',
        '%',
      ),
    );
    result.add(MyVirtualDivider(Color(0xFF34A853)));
    result.add(
      _columnInfo(
        HugeIcons.strokeRoundedCloudAngledRain,
        '${(forecast.rainProb * 100).round()}',
        '%',
      ),
    );
    result.add(MyVirtualDivider(Color(0xFF4285F4)));
    return result;
  }

  Widget _columnInfo(IconData iconData, String value, String unit) {
    return Column(
      spacing: 4,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(iconData, size: 32),
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
        ),
        Text(unit, textAlign: TextAlign.center),
      ],
    );
  }
}
