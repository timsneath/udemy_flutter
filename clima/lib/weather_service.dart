import 'package:geolocator/geolocator.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

const String WeatherUrl = 'http://api.openweathermap.org/data/2.5/weather';
const String AppID = '4c10e73922ec0d719662dd42a662d4ae';

class WeatherService {
  int temperature = 0;
  int condition = 0;
  String city;
  String weatherIconName;

  // This method turns a condition code into the name of the weather condition image
  String updateWeatherIcon(int condition) {
    if (condition >= 0 && condition <= 300) return 'tstorm1';
    if (condition >= 301 && condition <= 500) return 'light_rain';
    if (condition >= 501 && condition <= 600) return 'shower3';
    if (condition >= 601 && condition <= 700) return 'snow4';
    if (condition >= 701 && condition <= 771) return 'fog';
    if (condition >= 772 && condition <= 799) return 'tstorm3';
    if (condition == 800 || condition == 904) return 'sunny';
    if (condition >= 801 && condition <= 804) return 'cloudy2';
    if (condition == 903) return 'snow5';
    if (condition >= 900 && condition <= 1000) return 'tstorm3';
    return 'dunno';
  }

  Future<http.Response> getCurrentWeather(Position location) async {
    final uri = new Uri.http(WeatherUrl, '/', {
      "lat": location.latitude.toString(),
      "lon": location.longitude.toString()
    });

    return http.get(uri);
  }

  Future<Position> getCurrentPosition() async {
    Position position;

    try {
      position = await Geolocator().getCurrentPosition(LocationAccuracy.best);
    } on PlatformException {
      position = null;
    }

    return position;
  }
}
