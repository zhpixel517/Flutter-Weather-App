// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:my_weather/app/resources/colors.dart';
import 'package:my_weather/app/resources/constants.dart';
import 'package:my_weather/app/resources/font_styles.dart';
import 'package:my_weather/app/resources/padding.dart';
import 'package:my_weather/data/weather/weather_model.dart';
import 'package:my_weather/home/widgets/future_days.dart';
import 'package:my_weather/home/widgets/gradient_backgrounds.dart';
import 'package:my_weather/home/home_viewmodel.dart';
import 'package:my_weather/home/widgets/hourly_weather_slider.dart';
import 'package:my_weather/home/widgets/main_info_box.dart';
import 'package:weather/weather.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'widgets/future_day_row.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeViewModel _viewModel = HomeViewModel();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _onReferesh() {
    _viewModel.start();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Weather>>(
        stream: _viewModel.outputFutureWeatherData,
        builder: (context, futureSnapshot) {
          return StreamBuilder<Weather>(
              stream: _viewModel.outputCurrentWeatherData,
              builder: (context, snapshot) {
                WeatherModel weatherData = WeatherModel(snapshot);
                FutureWeatherModelImpl futureWeatherData =
                    FutureWeatherModelImpl(futureSnapshot);
                if (snapshot.data != null && futureSnapshot.data != null) {
                  return Stack(
                    children: [
                      Container(
                        decoration: getGradient(weatherData.condition!, false),
                      ),
                      SafeArea(
                          child: Scaffold(
                        backgroundColor: Colors.transparent,
                        body: SmartRefresher(
                          controller: _refreshController,
                          onRefresh: _onReferesh,
                          enablePullDown: true,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                _getDateAppBar(weatherData),
                                getMainInfoBox(context, weatherData),
                                Divider(color: CustomColors.offWhite),
                                _getHourlyWeather(futureSnapshot, snapshot),
                                Divider(color: CustomColors.offWhite),
                                _getFiveDayForecast(context, futureWeatherData),
                                FutureDaysBox(weatherData: weatherData)
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  );
                } else {
                  return Container(
                    decoration: getGradient("Cloudy", false),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: CustomColors.white,
                      ),
                    ),
                  );
                }
              });
        });
  }

  SizedBox _getFiveDayForecast(
      BuildContext context, FutureWeatherModelImpl futureWeatherModel) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          for (FutureWeatherModel day
              in futureWeatherModel.fiveDaysFuture ?? [])
            FutureDay(day)
        ],
      ),
    );
  }

  Widget _getHourlyWeather(AsyncSnapshot<List<Weather>> futureData,
      AsyncSnapshot<Weather> currentData) {
    if (futureData.hasData) {
      return SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: getHourlyWeatherSlider(futureData.data ?? [],
                currentData.data!.temperature!.fahrenheit!.round().toString()),
          ));
    } else {
      return Center(
          child: CircularProgressIndicator(color: CustomColors.white));
    }
  }
}

class ExtraWeatherInfoBlock extends StatelessWidget {
  final String dataType;
  final String data;

  const ExtraWeatherInfoBlock(
    this.dataType,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(dataType, style: lowTemperature()),
        const SizedBox(height: 10.0),
        Text(
          data,
          style: hourlyTemperatureTextStyle,
        )
      ],
    );
  }
}

Widget _getDateAppBar(WeatherModel weatherModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(
            top: AppPadding.appBarPadding, bottom: AppPadding.appBarPadding),
        child: Text(
          weatherModel.date ?? "",
          style: appBarTextStyle(),
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

BoxDecoration getGradient(String condition, bool bottomSheet) {
  switch (condition) {
    case AppStrings.sunny:
      return bottomSheet ? bottomSunnyGradient : sunnyGradient;
    case AppStrings.rainy:
      return bottomSheet ? bottomRainyGradient : rainyGradient;
    case AppStrings.cloudy:
      return bottomSheet ? bottomCloudyGradient : cloudyGradient;
    case AppStrings.snow:
      return bottomSheet ? bottomCloudyGradient : cloudyGradient;
    case AppStrings.thunderstorms:
      return bottomSheet ? bottomRainyGradient : rainyGradient;
    case AppStrings.clear:
      return bottomSheet
          ? bottomRainyGradient
          : rainyGradient; // for night time
    default:
      return bottomSheet ? bottomCloudyGradient : cloudyGradient;
  }
}
