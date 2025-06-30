import 'package:flutter/material.dart';

import 'package:trent/trent.dart';
import 'package:weather_app/src/repository/location_repository.dart';
import 'package:weather_app/src/trents/connection_trent.dart';
import 'package:weather_app/src/trents/states/connection_state.dart';

class CityTrent extends Trent<CityState> {
  final LocationRepository locationRepository;
  CityTrent(this.locationRepository) : super(CityLoading()) {
    _startListening();
  }

  void _startListening() {
    get<ConnectionTrent>().stateStream.listen((state) {
      if (state is ConnectionLoaded) {
        _fetchLocationData();
      }
    });
  }

  void _fetchLocationData() async {
    emit(CityLoading());
    locationRepository
        .getCityName()
        .then((city) {
          emit(CityLoaded(city));
        })
        .onError((e, s) {
          debugPrintStack(stackTrace: s);
        });
  }
}

abstract class CityState extends EquatableCopyable<CityState> {}

class CityLoading extends CityState {
  @override
  CityState copyWith() {
    return this;
  }

  @override
  List<Object?> get props => [];
}

class CityLoaded extends CityState {
  final String city;

  CityLoaded(this.city);
  @override
  CityState copyWith({String? c}) {
    return CityLoaded(c ?? city);
  }

  @override
  List<Object?> get props => [city];
}
