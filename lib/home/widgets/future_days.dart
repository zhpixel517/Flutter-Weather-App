import 'package:flutter/material.dart';
import 'package:my_weather/home/home.dart';

import '../../app/resources/padding.dart';
import '../../data/weather/weather_model.dart';

class FutureDaysBox extends StatelessWidget {
  const FutureDaysBox({
    Key? key,
    required this.weatherData,
  }) : super(key: key);

  final WeatherModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: getGradient(weatherData.condition!, true),
        height: MediaQuery.of(context).size.height * 0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: AppPadding.appSidePadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExtraWeatherInfoBlock(
                      "Sunrise", "${weatherData.sunrise} a.m"),
                  ExtraWeatherInfoBlock(
                      "Precipitation", "${weatherData.feelsLike}%"),
                  ExtraWeatherInfoBlock("Wind", "${weatherData.wind} m/s"),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: AppPadding.appSidePadding * 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExtraWeatherInfoBlock("Sunset",
                      "${weatherData.sunsetHour}:${weatherData.sunsetMinute} p.m"),
                  ExtraWeatherInfoBlock("Humidity", "${weatherData.humidity}%"),
                  ExtraWeatherInfoBlock(
                      "Pressure", "${weatherData.pressure} Pa"),
                ],
              ),
            ),
          ],
        ));
  }
}
