import 'package:flutter/material.dart';
import 'package:weather_app/src/bloc/bloc.dart';

class Provider extends InheritedWidget {
  final bloc = Bloc("cc7ea74c6101f3d5ba6ee2b6e186b5be");

  Provider({super.key, required super.child});

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static Bloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.bloc;
  }
}
