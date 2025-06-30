import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/master_weather_trent.dart';
import 'package:weather_app/src/widgets/draggable_forecast.dart';
import 'package:weather_app/src/widgets/loading/loading_main_weather.dart';
import 'package:weather_app/src/widgets/main_weather.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return watchMap<MasterWeatherTrent, MasterWeatherState>(context, (mapper) {
      mapper
        ..as<MasterWeatherLoaded>((state) {
          return _FadeInWidget(
            child: Stack(children: [MainWeather(), DraggableForecast()]),
          );
        })
        ..orElse((_) => LoadingMainWeather());
    });
  }
}

class _FadeInWidget extends StatefulWidget {
  final Widget child;

  const _FadeInWidget({required this.child});

  @override
  State<_FadeInWidget> createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<_FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1100),
      vsync: this,
    );
    _animation = CurveTween(curve: Curves.easeInExpo).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _animation, child: widget.child);
  }
}
