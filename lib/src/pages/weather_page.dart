import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/src/bloc/weather_controller.dart';
import 'package:weather_app/src/widgets/draggable_forecast.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';
import 'package:weather_app/src/widgets/main_forecast.dart';

const apiKey = "cc7ea74c6101f3d5ba6ee2b6e186b5be";

class WeatherPage extends StatelessWidget {
  final WeatherController weatherController = Get.find();

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = weatherController.isLoading.value;
      final error = weatherController.error.value;
      final weather = weatherController.weather.value;

      if (error != null) {
        return GenericError(
          animationName: "invalid_request",
          message: "Something went wrong while fetching weather data.",
        );
      }

      if (isLoading) {
        return LoadingSpin();
      }

      debugPrint(weather!.forecastList.length.toString());
      return Stack(
        children: [
          MainForecast(weatherModel: weather),
          DraggableForecast(weatherModel: weather),
        ],
      );
    });
  }
}
