import 'package:trent/trent.dart';

class UnitState extends EquatableCopyable<UnitState> {
  UnitState({this.unitMode = UnitMode.initial}); // Default Unit = metric Unit

  final UnitMode unitMode;

  // `copyWith()` method allows us to emit brand new instance of UnitState
  @override
  UnitState copyWith({UnitMode? u}) {
    return UnitState(unitMode: u ?? unitMode);
  }

  @override
  List<Object?> get props => [unitMode];
}

enum UnitMode { initial, metric, imperial }
