import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/src/animation/draggable_arrow_controller.dart';
import 'package:weather_app/src/bloc/bloc.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/forecast_card.dart';
import 'package:wheel_slider/wheel_slider.dart';
import 'package:collection/collection.dart' show groupBy;

class DraggableForecast extends StatelessWidget {
  final WeatherModel weatherModel;
  final Bloc bloc;
  final draggableArrowController = Get.put(DraggableArrowController());
  late final DraggableScrollableController dragController;

  DraggableForecast({
    super.key,
    required this.weatherModel,
    required this.bloc,
  });

  @override
  Widget build(BuildContext context) {
    dragController = draggableArrowController.dragController;
    return DraggableScrollableSheet(
      initialChildSize: 0.06,
      minChildSize: 0.06,
      maxChildSize: 0.5,
      snapSizes: const [0.06],
      snap: true,
      expand: true,
      controller: dragController,
      builder: (BuildContext context, ScrollController scrollController) {
        dragController.addListener(draggableArrowController.listener);

        return DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.5),
                spreadRadius: 2,
                blurRadius: 8,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],

            borderRadius: BorderRadiusDirectional.vertical(
              top: Radius.circular(16),
              bottom: Radius.circular(0),
            ),
            color: Theme.of(context).colorScheme.secondary,
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
                      _buildForecastList(context, weatherModel),
                      _buildScrollTab(context, weatherModel),
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

  Widget _buildForecastList(BuildContext context, WeatherModel weatherModel) {
    return StreamBuilder<List<ForecastItem>>(
      stream: bloc.forecastStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<ForecastItem>> snapshot,
      ) {
        if (!snapshot.hasData) {
          return Container();
        }

        final ForecastItem forecast = snapshot.data![0];
        return Expanded(flex: 8, child: ForecastCard(forecast));
      },
    );
  }

  Widget _buildScrollTab(BuildContext context, WeatherModel weatherModel) {
    Map<DateTime, List<ForecastItem>> tabMap = groupBy(
      weatherModel.forecastList,
      (f) => f.dt,
    );

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
          margin: EdgeInsets.only(top: 30),
          child: Icon(Icons.circle, size: 4),
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
