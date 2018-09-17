import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'weather_page.dart';

void main() => runApp(ClimaApp());

class ClimaApp extends StatelessWidget {
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      title: 'Clima',
      home: WeatherPage(),
    );
  }
}
