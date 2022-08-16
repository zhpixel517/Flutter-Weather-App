import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_weather/app/resources/colors.dart';

TextStyle interFont = GoogleFonts.inter();

TextStyle appBarTextStyle({double fontSize = FontSizes.appBarSize}) {
  return interFont.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: CustomColors.white);
}

TextStyle temperatureTextStyle(
    {double fontSize = FontSizes.temperatureTextSize}) {
  return interFont.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w800,
      color: CustomColors.white);
}

TextStyle weatherConditionTextStyle = appBarTextStyle();

TextStyle hourlyTemperatureTextStyle =
    smallTemperatureStyle(fontSize: FontSizes.hourlyTempSize);

TextStyle smallTemperatureStyle({double fontSize = FontSizes.highLowTextSize}) {
  return interFont.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: CustomColors.white);
}

TextStyle lowTemperature({double fontSize = FontSizes.highLowTextSize}) {
  return interFont.copyWith(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: CustomColors.offWhite);
}

class FontSizes {
  static const double appBarSize = 18.0;
  static const double highLowTextSize = 16.0;
  static const double temperatureTextSize = 100.0;
  static const double placeNameTextSize = 25.0;
  static const double hourlyTempSize = 20.0;
}
