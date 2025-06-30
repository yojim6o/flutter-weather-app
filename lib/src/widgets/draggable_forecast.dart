import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/models/forecast/forecast_data.dart';
import 'package:weather_app/src/models/weather/weather_data.dart';
import 'package:weather_app/src/trents/forecast_card_trent.dart';
import 'package:weather_app/src/trents/forecast_trent.dart';
import 'package:weather_app/src/utils/utils.dart';
import 'package:weather_app/src/widgets/forecast_card.dart';
import 'package:wheel_slider/wheel_slider.dart';

class DraggableForecast extends StatelessWidget {
  const DraggableForecast({super.key});

  @override
  Widget build(BuildContext context) {
    /* debugPrint(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage->DraggableSheet",
    ); */
    return watchMap<ForecastTrent, ForecastState>(context, (mapper) {
      mapper
        ..as<ForecastLoaded>(
          (state) => _buildDraggable(
            list: _ForecastList(),
            scrollTab: _ScrollTab(data: state.data),
          ),
        )
        ..orElse((_) => const Material());
    });
  }

  DraggableScrollableSheet _buildDraggable({
    required Widget list,
    required Widget scrollTab,
  }) {
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
            color: ColorScheme.of(context).surfaceContainer,
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
                    children: [list, scrollTab],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      //),
    );
  }
}

class _ForecastList extends StatelessWidget {
  const _ForecastList();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: watchMap<ForecastCardTrent, ForecastCardState>(context, (mapper) {
        mapper
          ..as<ForecastItemLoaded>((state) => ForecastCard(state.data))
          ..orElse((_) => const SizedBox.shrink());
      }),
    );
  }
}

class _ScrollTab extends StatelessWidget {
  final ForecastData data;
  late final Map<String, List<WeatherData>> map;
  final ForecastCardTrent trent = get<ForecastCardTrent>();

  _ScrollTab({required this.data}) {
    map = Utils.mapWeatherToForecastItems(data);
    trent.addWeatherItem(map.entries.elementAt(0).value);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: WheelSlider.customWidget(
        totalCount: map.length,
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
          trent.addWeatherItem(map.entries.elementAt(val).value);
        },
        children: List.generate(
          map.length,
          (index) => Center(
            child: Text(
              map.keys.elementAt(index),
              style: TextTheme.of(context).bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
