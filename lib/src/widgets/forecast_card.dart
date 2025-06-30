import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';
import 'package:weather_app/src/trents/unit_trent.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/utility/my_virtual_divider.dart';

class ForecastCard extends StatelessWidget {
  final WeatherData data;
  ForecastCard(this.data, {super.key});

  final colors = [
    const Color.fromARGB(195, 66, 134, 244),
    const Color.fromARGB(195, 234, 68, 53),
    const Color.fromARGB(195, 251, 189, 5),
    const Color.fromARGB(195, 52, 168, 83),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header([
              Text(
                'Hourly Forecast',
                textAlign: TextAlign.center,
                style: TextTheme.of(context).headlineSmall,
              ),
            ]),
            _animationRow(
              Utils.getWeatherAnimation(data.mainCondition, data.isDay),
              Column(
                children: [
                  Text(Utils.formatDate(data.date, 'EEE dd, MMM')),
                  Text(
                    "${data.date.hour}h",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ],
              ),
            ),
            _descriptionRow(),
            _tableRow(_buildColumns(context)),
          ],
        ),
      ),
    );
  }

  Widget _header(List<Widget> children) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 16,
      children: [...children],
    );
  }

  Widget _animationRow(Widget child1, Widget child2) {
    return Row(
      children: [
        Expanded(flex: 3, child: child1),
        Expanded(flex: 2, child: child2),
      ],
    );
  }

  Widget _descriptionRow() {
    return Center(child: Text(data.description));
  }

  Widget _tableRow(List<Widget> children) {
    return IntrinsicHeight(
      child: Row(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [...children],
      ),
    );
  }

  List<Widget> _buildColumns(BuildContext context) {
    final unitTrent = watch<UnitTrent>(context);
    final unitState = unitTrent.state;
    final List<Map<String, dynamic>> details = [
      {
        'icon': HugeIcons.strokeRoundedTemperature,
        'value': data.temp.onUnit(unitState.unitMode).round().toString(),
        'unit': Utils.resolveTempSymbol(unitState.unitMode),
      },
      {
        'icon': HugeIcons.strokeRoundedFastWind,
        'value': data.windSpeed.onUnit(unitState.unitMode).round().toString(),
        'unit': Utils.resolveSpeedSymbol(unitState.unitMode),
      },
      {
        'icon': HugeIcons.strokeRoundedHumidity,
        'value': '${data.humidity.round()}',
        'unit': '%',
      },
      {
        'icon': HugeIcons.strokeRoundedCloudAngledRain,
        'value': '${(data.rainProbability * 100).round()}',
        'unit': '%',
      },
    ];

    final List<Widget> list = [];
    int currentIndex = -1;

    for (var e in details) {
      list.add(MyVirtualDivider(colors[(++currentIndex) % colors.length]));
      list.add(
        Column(
          spacing: 4,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(e['icon'], size: 32, color: IconTheme.of(context).color),
            Text(
              e['value'],
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            Text(e['unit'], textAlign: TextAlign.center),
          ],
        ),
      );
    }

    list.add(MyVirtualDivider(colors[(currentIndex + 1) % colors.length]));

    return list;
  }
}
