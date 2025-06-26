import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingSpin extends StatelessWidget {
  const LoadingSpin({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitRipple(
      color: Colors.amber /* Theme.of(context).colorScheme.tertiary */,
    );
  }
}
