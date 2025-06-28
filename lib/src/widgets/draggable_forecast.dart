import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:trent/trent.dart';
import 'package:weather_app/src/trents/forecast_trent.dart';
import 'package:weather_app/src/models/weather_model.dart';
import 'package:weather_app/src/widgets/forecast_card.dart';
import 'package:wheel_slider/wheel_slider.dart';

class DraggableForecast extends StatelessWidget {
  final Map<String, List<ForecastItem>> forecastMap;

  DraggableForecast({super.key, required this.forecastMap}) {
    get<ForecastTrent>().addForecastList(
      forecastMap.entries.elementAtOrNull(0)?.value ?? [],
    );
  }

  @override
  Widget build(BuildContext context) {
    /* debugPrint(
      "Build App->AppView->Builder->ConnectionStatusListenerPage->WetaherPage->DraggableSheet",
    ); */
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
      //),
    );
  }

  Widget _buildForecastList(BuildContext context) {
    return Expanded(
      flex: 8,
      child: watchMap<ForecastTrent, ForecastState>(context, (mapper) {
        mapper
          ..as<ForecastLoaded>((state) => ForecastCard(state.forecastItem))
          ..orElse((_) => const SizedBox.shrink());
      }),
    );
  }

  Widget _buildScrollTab(BuildContext context) {
    final forecastTrent = get<ForecastTrent>();

    return Expanded(
      flex: 2,
      child: WheelSlider.customWidget(
        totalCount: forecastMap.length,
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
          forecastTrent.addForecastList(
            forecastMap.entries.elementAt(val).value,
          );
        },
        children: List.generate(
          forecastMap.length,
          (index) => Center(
            child: Text(
              forecastMap.keys.elementAt(index),
              style: TextTheme.of(context).bodyMedium,
            ),
          ),
        ),
      ),
    );
  }
}
