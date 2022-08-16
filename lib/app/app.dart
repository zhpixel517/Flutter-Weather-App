// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_weather/home/home.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:weather/weather.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp._internal();

  static const WeatherApp instance = WeatherApp._internal();

  factory WeatherApp() => instance;

  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  late Weather weather;
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    _requestPermissions();
  }

  void _requestPermissions() async {
    [Permission.location].request();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
