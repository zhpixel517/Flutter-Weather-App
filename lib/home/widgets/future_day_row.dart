import 'package:flutter/material.dart';
import 'package:my_weather/data/weather/condition_codes.dart';
import 'package:my_weather/data/weather/weather_model.dart';
import 'package:weather/weather.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../app/resources/colors.dart';
import '../../app/resources/constants.dart';
import '../../app/resources/font_styles.dart';
import '../../app/resources/padding.dart';
import '../../data/times/date.dart';

class FutureDay extends StatelessWidget {
  final FutureWeatherModel _weatherData;

  const FutureDay(
    this._weatherData, {
    Key? key,
  }) : super(key: key);

  Icon _getCorrectConditionIcon(String code) {
    String condition = WeatherCodes().getWeatherCondition(code);
    switch (condition) {
      case AppStrings.sunny:
        return Icon(WeatherIcons.day_sunny,
            color: CustomColors.offWhite, size: 20.0);
      case AppStrings.cloudy:
        return Icon(
          WeatherIcons.cloudy,
          color: CustomColors.offWhite,
          size: 20.0,
        );
      case AppStrings.thunderstorms:
        return Icon(
          WeatherIcons.thunderstorm,
          color: CustomColors.offWhite,
          size: 20.0,
        );
      case AppStrings.rainy:
        return Icon(
          WeatherIcons.rain,
          color: CustomColors.offWhite,
          size: 20.0,
        );
      default:
        return const Icon(Icons.help);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.futureWeatherDaysPadding,
            bottom: AppPadding.futureWeatherDaysPadding),
        child: Padding(
          padding: const EdgeInsets.only(left: AppPadding.appSidePadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: constraints.maxWidth * 0.245,
                child: Text(
                  Dates.getWeekday(_weatherData.date!.weekday, true),
                  style: weatherConditionTextStyle,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      bottom: 7.0), // hard coded val that seems to work
                  child: _getCorrectConditionIcon(
                      _weatherData.conditionCode.toString())),
              Padding(
                padding:
                    const EdgeInsets.only(right: AppPadding.appSidePadding),
                child: SizedBox(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "${_weatherData.tempMax?.fahrenheit?.round().toString()}",
                        style: smallTemperatureStyle(),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        "${_weatherData.tempMin?.fahrenheit?.round().toString()}",
                        style: lowTemperature(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
