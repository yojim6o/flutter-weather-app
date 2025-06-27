// weather_state.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:geolocator/geolocator.dart';
import 'package:trent/trent.dart';

abstract class ConnectionStatus extends EquatableCopyable<ConnectionStatus> {
  ConnectionStatus();

  @override
  List<Object?> get props => [];
}

class ConnectionLoading extends ConnectionStatus {
  @override
  ConnectionStatus copyWith() {
    return this;
  }
}

class ConnectionLoaded extends ConnectionStatus {
  final ServiceStatus serviceStatus;
  final List<ConnectivityResult> connectivityResult;

  ConnectionLoaded({
    required this.serviceStatus,
    required this.connectivityResult,
  });

  @override
  List<Object?> get props => [serviceStatus, connectivityResult];

  @override
  ConnectionStatus copyWith({
    ServiceStatus? location,
    List<ConnectivityResult>? network,
  }) {
    return ConnectionLoaded(
      serviceStatus: location ?? serviceStatus,
      connectivityResult: network ?? connectivityResult,
    );
  }
}

class ConnectionError extends ConnectionStatus {
  final String error;

  ConnectionError(this.error);

  @override
  ConnectionStatus copyWith({String? e}) {
    return ConnectionError(e ?? error);
  }
}

class LocationDisabled extends ConnectionStatus {
  @override
  ConnectionStatus copyWith() {
    return this;
  }
}

class NetworkDisabled extends ConnectionStatus {
  @override
  ConnectionStatus copyWith() {
    return this;
  }
}
