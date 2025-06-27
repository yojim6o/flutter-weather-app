import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/connection_trent.dart';
import 'package:weather_app/src/trents/states/connection_state.dart';
import 'package:weather_app/src/pages/weather_page.dart';
import 'package:weather_app/src/widgets/error/generic_error.dart';
import 'package:weather_app/src/widgets/utility/loading_spin.dart';

class ConnectionStatusListenerPage extends StatelessWidget {
  const ConnectionStatusListenerPage({super.key});

  @override
  Widget build(BuildContext context) {
    //debugPrint("Build App->AppView->Builder->ConnectionStatusListener");
    return watchMap<ConnectionTrent, ConnectionStatus>(context, (mapper) {
      mapper
        ..as<ConnectionLoading>((state) => const LoadingSpin())
        ..as<LocationDisabled>(
          (state) => const GenericError(
            animationName: "location_disabled",
            message: 'Location service is disabled',
          ),
        )
        ..as<NetworkDisabled>(
          (state) => const GenericError(
            animationName: "invalid_request",
            message: 'No internet connection',
          ),
        )
        ..as<ConnectionLoaded>((state) => const WeatherPage())
        ..orElse((_) => const Material());
    });
  }
}
