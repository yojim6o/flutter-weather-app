import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:intl/intl.dart';
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
            style: TextTheme.of(context).headlineSmall,
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
          child: Utils.getWeatherAnimation(
            forecast.mainCondition,
            forecast.isDay,
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Column(
              children: [
                Text(DateFormat('EEE dd, y').format(forecast.dt)),
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
        children: [..._buildDetailsColumns(context)],
      ),
    );
  }

  List<Widget> _buildDetailsColumns(BuildContext context) {
    final List<Map<String, dynamic>> details = [
      {
        'icon': HugeIcons.strokeRoundedTemperature,
        'value': '${forecast.temperature.round()}',
        'unit': 'º',
        'color': const Color(0xFF4285F4),
      },
      {
        'icon': HugeIcons.strokeRoundedFastWind,
        'value': '${forecast.wind.round()}',
        'unit': 'm/s',
        'color': const Color(0xFFEA4335),
      },
      {
        'icon': HugeIcons.strokeRoundedHumidity,
        'value': '${forecast.humidity.round()}',
        'unit': '%',
        'color': const Color(0xFFFBBC05),
      },
      {
        'icon': HugeIcons.strokeRoundedCloudAngledRain,
        'value': '${(forecast.rainProb * 100).round()}',
        'unit': '%',
        'color': const Color(0xFF34A853),
      },
    ];

    return [
      for (var detail in details) ...[
        MyVirtualDivider(detail['color']),
        Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(detail['icon'], size: 32, color: IconTheme.of(context).color),
            Text(
              detail['value'],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Text(detail['unit'], textAlign: TextAlign.center),
          ],
        ),
      ],
      MyVirtualDivider(const Color(0xFF4285F4)),
    ];
  }
}
