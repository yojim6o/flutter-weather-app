// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/utils/utils.dart';

class LoadingMainForecast extends StatefulWidget {
  const LoadingMainForecast({super.key});

  @override
  State<LoadingMainForecast> createState() => _LoadingMainForecastState();
}

class _LoadingMainForecastState extends State<LoadingMainForecast> {
  late Timer _timer;
  final Random _random = Random();

  int _temperature = 20;
  int _feelsLike = 22;
  String _cityName = "CARGANDO...";
  Widget _lottie = Utils.getWeatherAnimation('clear', false);

  final List<String> _randomCities = [
    "VALENCIA",
    "MADRID",
    "BARCELONA",
    "SEVILLA",
    "BILBAO",
    "MÁLAGA",
    "MURCIA",
    "PALMA",
    "ZARAGOZA",
    "CÓRDOBA",
    "LUGO",
    "CÁCERES",
  ];

  final List<Widget> _randomLotties = [
    Utils.getWeatherAnimation('clear', true),
    Utils.getWeatherAnimation('rain', true),
    Utils.getWeatherAnimation('clouds', true),
    Utils.getWeatherAnimation('thunderstorm', true),
    Utils.getWeatherAnimation('clear', false),
    Utils.getWeatherAnimation('rain', false),
    Utils.getWeatherAnimation('clouds', false),
  ];

  @override
  void initState() {
    super.initState();

    _generateRandomValues();

    _timer = Timer.periodic(const Duration(milliseconds: 200), (timer) {
      if (mounted) {
        setState(() {
          _generateRandomValues();
        });
      }
    });
  }

  void _generateRandomValues() {
    _temperature = _random.nextInt(40) + 5; // 5-45°C
    _feelsLike = _temperature + _random.nextInt(6) - 3; // ±3 grados
    _cityName = _randomCities[_random.nextInt(_randomCities.length)];
    _lottie = _randomLotties[_random.nextInt(_randomLotties.length)];
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _LoadingCityLabel(_cityName),
            _lottie,
            _LoadingTemperatureLabel(
              temperature: _temperature,
              feelsLike: _feelsLike,
            ),
          ],
        ),
        /* const UnitSwitch(),
        const ThemeSwitch(), */
      ],
    );
  }
}

class _LoadingCityLabel extends StatelessWidget {
  final String cityName;

  const _LoadingCityLabel(this.cityName);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.location_on,
          color: IconTheme.of(context).color?.withOpacity(0.7),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: Text(
            cityName,
            key: ValueKey(cityName),
            style: TextTheme.of(context).titleLarge?.copyWith(
              fontFamily: GoogleFonts.oswald().fontFamily,
              color: Theme.of(
                context,
              ).textTheme.titleLarge?.color?.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingWeatherAnimation extends StatefulWidget {
  const _LoadingWeatherAnimation();

  @override
  State<_LoadingWeatherAnimation> createState() =>
      _LoadingWeatherAnimationState();
}

class _LoadingWeatherAnimationState extends State<_LoadingWeatherAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      child: Icon(Icons.cloud, size: 120, color: Colors.grey.withOpacity(0.5)),
      builder: (context, child) {
        return Transform.scale(scale: _pulseAnimation.value, child: child);
      },
    );
  }
}

class _LoadingTemperatureLabel extends StatelessWidget {
  final int temperature;
  final int feelsLike;

  const _LoadingTemperatureLabel({
    required this.temperature,
    required this.feelsLike,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: Text(
            '$temperatureº',
            key: ValueKey(temperature),
            style: TextTheme.of(context).displayMedium?.copyWith(
              fontFamily: GoogleFonts.oswald().fontFamily,
              fontWeight: FontWeight.w800,
              color: Theme.of(
                context,
              ).textTheme.displayMedium?.color?.withOpacity(0.7),
            ),
          ),
        ),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 150),
          child: Text(
            '/$feelsLikeº',
            key: ValueKey(feelsLike),
            style: TextTheme.of(context).bodyLarge?.copyWith(
              fontFamily: GoogleFonts.oswald().fontFamily,
              color: Theme.of(
                context,
              ).textTheme.bodyLarge?.color?.withOpacity(0.7),
            ),
          ),
        ),
      ],
    );
  }
}
