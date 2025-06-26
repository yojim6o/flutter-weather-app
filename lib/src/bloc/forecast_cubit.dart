// Forecast_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:weather_app/src/models/weather_model.dart';

class ForecastCubit extends Cubit<List<ForecastItem>> {
  ForecastCubit(super.initialState);

  void addForecastList(List<ForecastItem> list) => emit(list);
}
