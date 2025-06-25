class WeatherModel {
  final String? cityName;
  final List<ForecastItem> forecastList;
  final DateTime sunrise;
  final DateTime sunset;

  WeatherModel({
    required this.cityName,
    required this.forecastList,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    final city =
        '${json['city']['name'] as String?}, ${json['city']['country'] as String?}';
    final sunrise = DateTime.fromMillisecondsSinceEpoch(
      json['city']['sunrise'] * 1000,
    );
    final sunset = DateTime.fromMillisecondsSinceEpoch(
      json['city']['sunset'] * 1000,
    );
    final forecastData = json['list'] as List<dynamic>?;

    return WeatherModel(
      cityName: city,
      forecastList:
          forecastData != null
              ? forecastData
                  // map each review to a Review object
                  .map(
                    (fd) => ForecastItem.fromJson(
                      fd as Map<String, dynamic>,
                      sunrise,
                      sunset,
                    ),
                  )
                  .toList() // map() returns an Iterable so we convert it to a List
              : <ForecastItem>[],
      sunrise: sunrise,
      sunset: sunset,
    );
  }
}

class ForecastItem {
  final DateTime dt;
  final double temperature;
  final double wind;
  final double rainProb;
  final double humidity;
  final double feelsLike;
  final String mainCondition;
  final String secondaryCondition;
  final bool isDay;

  ForecastItem({
    required this.wind,
    required this.rainProb,
    required this.humidity,
    required this.dt,
    required this.temperature,
    required this.feelsLike,
    required this.mainCondition,
    required this.secondaryCondition,
    required this.isDay,
  });

  factory ForecastItem.fromJson(
    Map<String, dynamic> json,
    DateTime sunrise,
    DateTime sunset,
  ) {
    final dt = DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000);
    final isDay =
        (dt.hour * 60 + dt.minute) > (sunrise.hour * 60 + sunrise.minute) &&
        (dt.hour * 60 + dt.minute) < (sunset.hour * 60 + sunset.minute);
    return ForecastItem(
      dt: dt,
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      secondaryCondition: json['weather'][0]['description'],
      wind: json['wind']['speed'].toDouble(),
      rainProb: json['pop'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      isDay: isDay,
    );
  }
}
