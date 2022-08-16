import 'package:flutter/material.dart';
import 'package:my_weather/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Paint.enableDithering = true;
  runApp(WeatherApp());
}
