import 'dart:async';
import 'package:trent/trent.dart';
import 'package:weather_app/src/repository/Unit_repository.dart';
import 'package:weather_app/src/trents/states/unit_state.dart';

class UnitTrent extends Trent<UnitState> {
  UnitTrent(UnitPersistence unitRepository)
    : _unitRepository = unitRepository,
      super(UnitState()) {
    _startListening();
  }

  final UnitPersistence _unitRepository;
  late StreamSubscription<UnitEnum> _unitSubscription;
  // used to determine if the current Unit is dark
  static late bool _isMetric;

  void _startListening() {
    // Since `getUnit()` returns a stream, we listen to the output
    _unitSubscription = _unitRepository.getUnit().listen((customUnit) {
      if (customUnit.name == UnitEnum.imperial.name) {
        // Since, `customUnit` is imperial, we set `_isMetric` to false
        _isMetric = false;
        emit(state.copyWith(u: UnitMode.imperial));
      } else {
        // Since, `customUnit` is metric, we set `_isMetric` to true
        _isMetric = true;
        emit(state.copyWith(u: UnitMode.metric));
      }
    });
  }

  void switchUnit() {
    if (_isMetric) {
      // Since, currentUnit is metric, after switching we want imperial Unit to
      // be persisted.
      _unitRepository.saveUnit(UnitEnum.imperial);
    } else {
      // Since, currentUnit is imperial, after switching we want metric Unit to
      // be persisted.
      _unitRepository.saveUnit(UnitEnum.metric);
    }
  }

  close() {
    _unitSubscription.cancel();
    _unitRepository.dispose();
    dispose();
  }
}
