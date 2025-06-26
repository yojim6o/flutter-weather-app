/* import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/status_controller.dart';

class StatusProvider extends InheritedWidget {
  final bloc = StatusController();

  StatusProvider({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static StatusController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<StatusProvider>()!.bloc;
  }
}
 */
