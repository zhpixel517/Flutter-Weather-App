import 'package:flutter/material.dart';
import 'package:my_weather/data/weather/weather_model.dart';
import 'package:weather_icons/weather_icons.dart';
import '../../app/resources/colors.dart';
import '../../app/resources/constants.dart';
import '../../app/resources/font_styles.dart';
import '../../app/resources/padding.dart';

SizedBox getMainInfoBox(BuildContext context, WeatherModel weatherData) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.415,
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Container(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppPadding.appSidePadding),
                  child: Text(
                    weatherData.placeName ?? "",
                    style:
                        appBarTextStyle(fontSize: FontSizes.placeNameTextSize),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.appSidePadding - 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          weatherData.temperature ?? "",
                          style: temperatureTextStyle(),
                        ),
                        const SizedBox(
                            height: AppPadding.temperatureReadingPadding),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            highLowTemp(
                                high: true, temperature: weatherData.highTemp),
                            highLowTemp(
                                high: false, temperature: weatherData.lowTemp)
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(left: AppPadding.appSidePadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        weatherData.condition ?? "",
                        style: weatherConditionTextStyle,
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        "Feels like ${weatherData.feelsLike}${AppStrings.degrees}",
                        style: lowTemperature(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(child: getCorrectIcon(weatherData))
      ],
    ),
  );
}

getCorrectIcon(WeatherModel weatherModel) {
  switch (weatherModel.condition) {
    case AppStrings.sunny:
      return Padding(
        padding: const EdgeInsets.only(left: 50.0, bottom: 110.0),
        child: Icon(
          WeatherIcons.day_sunny,
          size: 200.0,
          color: CustomColors.white,
        ),
      );
    case AppStrings.cloudy:
      return Padding(
        padding: const EdgeInsets.only(left: 30.0, bottom: 150.0),
        child: Icon(
          WeatherIcons.cloudy,
          size: 200.0,
          color: CustomColors.white,
        ),
      );
    case AppStrings.rainy:
      return Padding(
        padding: const EdgeInsets.only(left: 50.0, bottom: 150.0),
        child: Icon(
          WeatherIcons.rain,
          size: 200.0,
          color: CustomColors.white,
        ),
      );
    case AppStrings.thunderstorms:
      return Padding(
          padding: const EdgeInsets.only(left: 50.0, bottom: 150.0),
          child: Icon(
            WeatherIcons.thunderstorm,
            size: 200.0,
            color: CustomColors.white,
          ));
    case AppStrings.snow:
      return Padding(
        padding: const EdgeInsets.only(left: 50.0, bottom: 150.0),
        child: Icon(
          WeatherIcons.snow,
          size: 200.0,
          color: CustomColors.white,
        ),
      );
    case AppStrings.clear:
      return Padding(
        padding: const EdgeInsets.only(left: 50.0, bottom: 150.0),
        child: Icon(
          WeatherIcons.night_clear,
          size: 200.0,
          color: CustomColors.white,
        ),
      );
    default:
      Padding(
        padding: const EdgeInsets.only(left: 75.0, bottom: 100.0),
        child: Icon(
          WeatherIcons.gale_warning,
          size: 200.0,
          color: CustomColors.white,
        ),
      );
  }
}

Widget highLowTemp({bool? high, String? temperature}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      high!
          ? Icon(
              Icons.keyboard_arrow_up_sharp,
              color: CustomColors.offWhite,
            )
          : Icon(
              Icons.keyboard_arrow_down_sharp,
              color: CustomColors.offWhite,
            ),
      Text(
        "$temperature${AppStrings.degrees}",
        style: smallTemperatureStyle(),
      )
    ],
  );
}
