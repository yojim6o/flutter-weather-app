import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

abstract class UnitPersistence {
  Stream<UnitEnum> getUnit();
  Future<void> saveUnit(UnitEnum unit);
  void dispose();
}

enum UnitEnum { metric, imperial }

class UnitRepository implements UnitPersistence {
  UnitRepository({required SharedPreferences sharedPreferences})
    : _sharedPreferences = sharedPreferences {
    _init();
  }

  final SharedPreferences _sharedPreferences;

  static const _kUnitPersistenceKey = '__unit_persistence_key__';

  final _controller = StreamController<UnitEnum>();

  Future<void> _setValue(String key, String value) =>
      _sharedPreferences.setString(key, value);

  String? _getValue(String key) {
    try {
      return _sharedPreferences.getString(key);
    } catch (_) {
      return null;
    }
  }

  void _init() {
    final unitString = _getValue(_kUnitPersistenceKey);
    if (unitString != null) {
      if (unitString == UnitEnum.metric.name) {
        _controller.sink.add(UnitEnum.metric);
      } else {
        _controller.sink.add(UnitEnum.imperial);
      }
    } else {
      _controller.sink.add(UnitEnum.metric);
    }
  }

  @override
  Stream<UnitEnum> getUnit() async* {
    yield* _controller.stream;
  }

  @override
  Future<void> saveUnit(UnitEnum unit) {
    _controller.sink.add(unit);
    return _setValue(_kUnitPersistenceKey, unit.name);
  }

  @override
  void dispose() => _controller.close();
}
