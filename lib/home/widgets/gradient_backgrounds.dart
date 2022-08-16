import 'package:flutter/material.dart';
import 'package:my_weather/app/resources/colors.dart';

const BoxDecoration sunnyGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [CustomColors.topOrange, CustomColors.bottomOrange]));

BoxDecoration rainyGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [CustomColors.topBlue!, CustomColors.bottomBlue]));

const BoxDecoration cloudyGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [CustomColors.topGrey, CustomColors.bottomGrey]));

BoxDecoration bottomSunnyGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
      CustomColors.bottomSheetTopOrange!,
      CustomColors.bottomOrange
    ]));

BoxDecoration bottomRainyGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [CustomColors.bottomSheetTopBlue!, CustomColors.bottomBlue]));

BoxDecoration bottomCloudyGradient = BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [CustomColors.bottomSheetTopGrey!, CustomColors.bottomGrey]));
