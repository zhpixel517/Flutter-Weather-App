import 'package:flutter/material.dart';
import 'package:my_weather/app/resources/constants.dart';

class WeatherCodes {
  // condition codes defined by Open Weather API
  // https://openweathermap.org/weather-conditions

  String getWeatherCondition(String? code) {
    // 800, 801, and 802 will be sunny gradient
    int codeCategory = _getSignificantDigit(code ?? "600");
    switch (codeCategory) {
      // 200, 300, 500 codes will be rainy gradient
      case 2:
        return AppStrings.thunderstorms;
      case 3:
        return AppStrings.rainy;
      case 5:
        return AppStrings.rainy;

      // 600, 700, and 803 and 804 will be cloudy gradient
      case 6:
        return AppStrings.cloudy;
      case 7:
        return AppStrings.cloudy;
      case 8:
        switch (code) {
          case "800":
            return AppStrings.sunny;
          case "801":
            return AppStrings.sunny;
          case "802":
            return AppStrings.sunny;
          case "803":
            return AppStrings.cloudy;
          case "804":
            return AppStrings.cloudy;
          default:
            return AppStrings.cloudy;
        }
      default:
        return AppStrings.cloudy;
    }
  }

  int _getSignificantDigit(String code) {
    int firstDigit = int.parse(code.characters.first);
    return firstDigit;
  }
}
