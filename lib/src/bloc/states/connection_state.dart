// weather_state.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

abstract class ConnectionStatus extends Equatable {
  const ConnectionStatus();

  @override
  List<Object?> get props => [];
}

class ConnectionLoading extends ConnectionStatus {}

class ConnectionLoaded extends ConnectionStatus {
  final ServiceStatus serviceStatus;
  final List<ConnectivityResult> connectivityResult;

  const ConnectionLoaded({
    required this.serviceStatus,
    required this.connectivityResult,
  });

  @override
  List<Object?> get props => [serviceStatus, connectivityResult];
}

class ConnectionError extends ConnectionStatus {
  final String error;

  const ConnectionError(this.error);
}

class LocationDisabled extends ConnectionStatus {}

class NetworkDisabled extends ConnectionStatus {}
