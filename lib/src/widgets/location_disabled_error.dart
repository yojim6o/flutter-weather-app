import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LocationDisabledError extends StatelessWidget {
  const LocationDisabledError({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/location_disabled.json"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Location service is disabled',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall?.copyWith(),
            ),
          ),
        ],
      ),
    );
  }
}
