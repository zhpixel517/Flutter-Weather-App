import 'package:my_weather/app/resources/constants.dart';
import 'package:weather/weather.dart';

WeatherFactory weatherFactory = WeatherFactory(apiKey);

Future<Weather> getWeatherData(double lat, double long) async {
  Weather weather = await weatherFactory.currentWeatherByLocation(lat, long);
  return weather;
}

Future<List<Weather>> getFutureForecast(double lat, double long) async {
  List<Weather> weather =
      await weatherFactory.fiveDayForecastByLocation(lat, long);
  return weather;
}
