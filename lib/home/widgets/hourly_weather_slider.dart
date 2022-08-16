import 'package:flutter/material.dart';
import 'package:my_weather/app/resources/font_styles.dart';
import 'package:my_weather/app/resources/padding.dart';
import 'package:my_weather/data/times/date.dart';
import 'package:weather/weather.dart';
import '../../app/resources/constants.dart';

Widget getHourlyWeatherSlider(
    List<Weather> futureWeatherData, String temperature) {
  List<Weather> tempList = futureWeatherData;
  if (futureWeatherData.isNotEmpty) {
    tempList.removeRange(7, futureWeatherData.length - 1);
  }
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      hourlyTempObject(Dates.thisHour, temperature, now: true),
      for (var item in tempList)
        hourlyTempObject(
            item.date!.hour > 12
                ? item.date!.hour - 12
                : item.date!.hour, // convert to 12 hour time if needed
            item.temperature?.fahrenheit
                ?.round()
                .toString(), // temperature for each item in future list
            now: false,
            am: item.date!.hour > 12 ? false : true)
    ],
  );
}

Widget hourlyTempObject(int hour, String? temperature,
    {bool now = false, bool am = true}) {
  return Padding(
    padding: const EdgeInsets.only(
        left: AppPadding.appSidePadding,
        right: AppPadding.hourlyTempHorizontalPadding),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        now
            ? Text("Now", style: lowTemperature())
            : Text(
                "$hour ${am ? "am" : "pm"}",
                style: lowTemperature(),
              ),
        const SizedBox(height: AppPadding.hourlyTempVerticalPadding),
        Text("$temperature${AppStrings.degrees}",
            style: hourlyTemperatureTextStyle)
      ],
    ),
  );
}
