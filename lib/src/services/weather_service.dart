import 'dart:async';
import 'dart:convert';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/main.dart';
import 'package:weather_app/src/models/weather_model.dart';

class WeatherService {
  static final Uri baseUrl = Uri(
    scheme: 'https',
    host: 'api.openweathermap.org',
    path: 'data/2.5/forecast',
  );
  final String apiKey = API_KEY;
  final client = http.Client();

  Future<WeatherModel> getWeather() async {
    final String cityName = await _determineCityName();
    final uri = baseUrl.replace(
      queryParameters: {'q': cityName, 'appid': apiKey, 'units': 'metric'},
    );
    //debugPrint("WeatherService: Calling $uri");
    final response = await client.get(uri);
    //debugPrint('WeatherService: ${response.body.substring(0, 20)}');

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<String> _determineCityName() async {
    Position position = await _determinePosition();
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isEmpty) {
      throw Error.safeToString("No city found with given coordinates");
    }

    return placemarks[0].locality!;
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
