// My own data class for all the weather data I need

import 'package:flutter/material.dart';
import 'package:my_weather/data/times/date.dart';
import 'package:weather/weather.dart';

import '../../app/resources/constants.dart';
import 'condition_codes.dart';

class WeatherModel {
  final AsyncSnapshot<Weather> _weatherData;
  String? date;
  String? placeName;
  String? temperature;
  String? condition;
  String? highTemp;
  String? lowTemp;
  String? feelsLike;
  String? sunrise;
  String? sunset;
  String? wind;
  String? pressure;
  String? humidity;
  int? sunsetHour;
  int? sunsetMinute;

  WeatherModel(this._weatherData) {
    Dates dateInstance = Dates();
    final WeatherCodes weatherCodesInstance = WeatherCodes();
    date = dateInstance.convertToDate(_weatherData.data?.date.toString() ?? "");
    condition = weatherCodesInstance.getWeatherCondition(
        _weatherData.data?.weatherConditionCode.toString());
    if (dateInstance.isNight(DateTime.now(), _weatherData.data)) {
      // place holder before init
      condition = AppStrings.clear;
    }
    placeName = _weatherData.data?.areaName.toString();
    temperature =
        "${_weatherData.data?.temperature?.fahrenheit?.round().toString()}${AppStrings.degrees}";
    highTemp = _weatherData.data?.tempMax?.fahrenheit?.round().toString();
    lowTemp = _weatherData.data?.tempMin?.fahrenheit?.round().toString();
    feelsLike =
        _weatherData.data?.tempFeelsLike?.fahrenheit?.round().toString();
    sunrise = dateInstance
        .getFormattedTime(_weatherData.data?.sunrise.toString() ?? "");
    sunset = dateInstance
        .getFormattedTime(_weatherData.data?.sunset.toString() ?? "");
    sunsetHour = Dates.hourFormat(_weatherData.data?.sunset?.hour ?? 0);
    sunsetMinute = _weatherData.data?.sunset?.minute;

    wind = _weatherData.data?.windSpeed.toString();
    pressure = _weatherData.data?.pressure?.round().toString();
    humidity = _weatherData.data?.humidity?.round().toString();
  }
}

class FutureWeatherModel {
  final AsyncSnapshot<List<Weather>> _weatherData;

  List<Weather>? fiveDaysFuture = [];

  FutureWeatherModel(this._weatherData) {
    for (Weather item in _weatherData.data ?? []) {
      if (item.date!.hour == 13) {
        fiveDaysFuture?.add(item);
      } else {
        continue;
      }
    }
  }
}
