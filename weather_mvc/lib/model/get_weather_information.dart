import 'dart:convert';

import 'package:http/http.dart';

class Weather {
  final double latitude;
  final double longitude;
  final double temperature;
  final String cityName;

  Weather(
      {required this.latitude,
      required this.longitude,
      required this.temperature,
      required this.cityName});
  factory Weather.fromWeather(dynamic decodedData) {
    return Weather(
      longitude: decodedData['coord']['lon'],
      latitude: decodedData['coord']['lat'],
      temperature: decodedData['main']['temp'],
      cityName: decodedData['name'],
    );
  }
}
