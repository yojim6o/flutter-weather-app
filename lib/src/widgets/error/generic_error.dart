import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GenericError extends StatelessWidget {
  final String animationName;
  final String message;
  const GenericError({
    super.key,
    required this.animationName,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/error/$animationName.json"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ),
        ],
      ),
    );
  }
}
