import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/bloc/weather_controller.dart';
import 'package:weather_app/src/bloc/weather_provider.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/forecast_card.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:collection/collection.dart' show groupBy;

class DraggableForecast extends StatelessWidget {
  final WeatherModel weatherModel;
  final WeatherController bloc;

  const DraggableForecast({
    super.key,
    required this.weatherModel,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    print(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage->DraggableSheet",
    );
    return DraggableScrollableSheet(
      initialChildSize: 0.06,
      minChildSize: 0.06,
      maxChildSize: 0.5,
      snapSizes: const [0.06],
      snap: true,
      expand: true,
      builder: (BuildContext context, ScrollController scrollController) {
        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: ColorScheme.of(context).tertiary,
                blurRadius: 8,
                spreadRadius: -2,
                offset: Offset(0, 4),
              ),
              BoxShadow(
                color: const Color.fromRGBO(9, 30, 66, 0.08),
                blurRadius: 0,
                spreadRadius: 1,
                offset: Offset(0, 0),
              ),
            ],
            borderRadius: const BorderRadiusDirectional.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(0),
            ),
            color: ColorScheme.of(context).surfaceContainerLowest,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            dragStartBehavior: DragStartBehavior.down,
            controller: scrollController,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8.0),
                    width: 30.0,
                    height: 3.0,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      _buildForecastList(context),
                      _buildScrollTab(context),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildForecastList(BuildContext context) {
    return Expanded(
      flex: 8,
      child: StreamBuilder<List<ForecastItem>>(
        stream: bloc.forecastStream,
        builder: (context, AsyncSnapshot<List<ForecastItem>> snapshot) {
          if (!snapshot.hasData) {
            return Material();
          }
          final forecastList = snapshot.data!;
          if (forecastList.isEmpty) return const SizedBox.shrink();
          return ForecastCard(forecastList.first);
        },
      ),
    );
  }

  Widget _buildScrollTab(BuildContext context) {
    final Map<DateTime, List<ForecastItem>> tabMap = groupBy(
      weatherModel.forecastList,
      (f) => f.dt,
    );

    // Inicializar una vez con la primera selección
    Future.microtask(() {
      bloc.addForecast(tabMap.entries.elementAt(0).value);
    });

    return Expanded(
      flex: 2,
      child: WheelSlider.customWidget(
        totalCount: tabMap.length,
        isInfinite: false,
        horizontal: false,
        showPointer: true,
        initValue: 0,
        itemSize: 80,
        listHeight: 200,
        verticalListHeight: 200,
        customPointer: Container(
          margin: const EdgeInsets.only(top: 30),
          child: const Icon(Icons.circle, size: 4),
        ),
        scrollPhysics: const BouncingScrollPhysics(),
        hapticFeedbackType: HapticFeedbackType.vibrate,
        onValueChanged: (val) {
          bloc.addForecast(tabMap.entries.elementAt(val).value);
        },
        children: List.generate(
          tabMap.length,
          (index) => Center(
            child: Text(
              Utils.formatDateToWheelItem(tabMap.keys.elementAt(index)),
            ),
          ),
        ),
      ),
    );
  }
}
