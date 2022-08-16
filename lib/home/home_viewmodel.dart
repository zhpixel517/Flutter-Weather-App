import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:my_weather/app/baseviewmodel.dart';
import 'package:my_weather/data/location/location.dart';
import 'package:my_weather/data/weather/weather_data.dart';
import 'package:weather/weather.dart';

class HomeViewModel extends BaseViewModel
    with HomeViewModelInputs, HomeViewModelOutputs {
  final StreamController _currentWeatherDataStreamController =
      StreamController<Weather>.broadcast();

  final StreamController _futureWeatherDataStreamController =
      StreamController<List<Weather>>.broadcast();

  @override
  void dispose() {
    _currentWeatherDataStreamController.close();
    _futureWeatherDataStreamController.close();
  }

  @override
  void start() async {
    Position location = await getLocation();
    Weather currentWeatherData =
        await getWeatherData(location.latitude, location.longitude);
    List<Weather> futureWeatherData =
        await getFutureForecast(location.latitude, location.longitude);
    inputCurrentWeatherData.add(currentWeatherData);
    inputFutureWeatherData.add(futureWeatherData);
  }

  @override
  Sink get inputCurrentWeatherData => _currentWeatherDataStreamController.sink;

  @override
  Sink get inputFutureWeatherData => _futureWeatherDataStreamController.sink;

  @override
  Stream<Weather> get outputCurrentWeatherData =>
      _currentWeatherDataStreamController.stream
          .map((weatherData) => weatherData);

  @override
  Stream<List<Weather>> get outputFutureWeatherData =>
      _futureWeatherDataStreamController.stream
          .map((futureWeatherData) => futureWeatherData);
}

abstract class HomeViewModelInputs {
  Sink get inputCurrentWeatherData;
  Sink get inputFutureWeatherData;
}

abstract class HomeViewModelOutputs {
  Stream<Weather> get outputCurrentWeatherData;
  Stream<List<Weather>> get outputFutureWeatherData;
}
