import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/src/bloc/provider.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/widgets/draggable_forecast.dart';
import 'package:weather_app/src/widgets/main_forecast.dart';

class WeatherPage extends StatelessWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    bloc.fetchWeatherInfo();
    WeatherModel weatherModel;

    return StreamBuilder<WeatherModel>(
      stream: bloc.weatherStream,
      builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error!.toString());
        }
        if (!snapshot.hasData) {
          return SpinKitSpinningLines(
            color: Theme.of(context).colorScheme.primary,
          );
        }

        weatherModel = snapshot.data!;
        return Stack(
          children: [
            MainForecast(weatherModel: weatherModel),
            DraggableForecast(weatherModel: weatherModel, bloc: bloc),
          ],
        );
      },
    );
  }
}
