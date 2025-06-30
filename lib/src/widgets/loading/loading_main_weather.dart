// ignore_for_file: deprecated_member_use
import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/src/utils/utils.dart';

class LoadingMainWeather extends StatefulWidget {
  const LoadingMainWeather({super.key});

  @override
  State<LoadingMainWeather> createState() => _LoadingMainWeatherState();
}

class _LoadingMainWeatherState extends State<LoadingMainWeather>
    with SingleTickerProviderStateMixin {
  late Timer _cityTimer;
  late Timer _messageTimer;
  late Timer _temperatureTimer;
  late Timer _lottieTimer;
  final Random _random = Random();

  int _temperature = 20;
  int _feelsLike = 22;
  String _cityName = "CARGANDO...";
  String _message = "Preparing location...";
  Widget _lottie = Utils.getWeatherAnimation('clear', false);
  int _lottieIndex = 0;
  int _messageIndex = 0;

  final List<String> _randomMessages = [
    "Resolving city...",
    "Checking network...",
    "Calculating location...",
  ];

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

  late AnimationController _animationController;
  final Tween<double> _opacityTween = Tween<double>(begin: 0.0, end: 1.0);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);

    _generateInitialValues();

    _cityTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          _cityName = _randomCities[_random.nextInt(_randomCities.length)];
        });
      }
    });

    _messageTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (mounted) {
        setState(() {
          _messageIndex = (_messageIndex + 1) % _randomMessages.length;
          _message = _randomMessages[_messageIndex];
        });
      }
    });

    _temperatureTimer = Timer.periodic(const Duration(milliseconds: 150), (
      timer,
    ) {
      if (mounted) {
        setState(() {
          _temperature = _random.nextInt(40) + 5; // 5-45°C
          _feelsLike = _temperature + _random.nextInt(6) - 3; // ±3 grados
        });
      }
    });

    _lottieTimer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      if (mounted) {
        setState(() {
          _lottieIndex = (_lottieIndex + 1) % _randomLotties.length;
          _lottie = _randomLotties[_lottieIndex];
        });
      }
    });
  }

  void _generateInitialValues() {
    _temperature = _random.nextInt(40) + 5;
    _feelsLike = _temperature + _random.nextInt(6) - 3;
    _cityName = _randomCities[_random.nextInt(_randomCities.length)];
    _lottieIndex = 0;
    _lottie = _randomLotties[_lottieIndex];
  }

  @override
  void dispose() {
    _cityTimer.cancel();
    _temperatureTimer.cancel();
    _lottieTimer.cancel();
    _messageTimer.cancel();
    _animationController.dispose();
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
        Stack(
          children: [
            Opacity(
              opacity: 0.6,
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: ColorScheme.of(context).secondaryFixedDim,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: AnimatedOpacity(
                opacity: _opacityTween.evaluate(_animationController),
                duration: Duration(seconds: 1),

                child: Text(
                  _message.toUpperCase(),
                  key: ValueKey(DateTime.now().microsecondsSinceEpoch),
                  style: TextTheme.of(context).headlineMedium?.copyWith(
                    fontFamily: GoogleFonts.oswald().fontFamily,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
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
        Text(
          cityName,
          key: ValueKey(cityName),
          style: TextTheme.of(context).titleLarge?.copyWith(
            fontFamily: GoogleFonts.oswald().fontFamily,
            color: Theme.of(
              context,
            ).textTheme.titleLarge?.color?.withOpacity(0.7),
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
        Text(
          '$temperatureº',
          style: TextTheme.of(context).displayMedium?.copyWith(
            fontFamily: GoogleFonts.oswald().fontFamily,
            fontWeight: FontWeight.w800,
            color: Theme.of(
              context,
            ).textTheme.displayMedium?.color?.withOpacity(0.7),
          ),
        ),

        Text(
          '/$feelsLikeº',
          style: TextTheme.of(context).bodyLarge?.copyWith(
            fontFamily: GoogleFonts.oswald().fontFamily,
            color: Theme.of(
              context,
            ).textTheme.bodyLarge?.color?.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
