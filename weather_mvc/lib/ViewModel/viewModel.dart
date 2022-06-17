import 'dart:convert';

import 'package:http/http.dart';
import 'package:weather_mvc/model/get_weather_information.dart';
import 'package:weather_mvc/view/display_weather.dart';

enum LoadingState { preloading, loading, loadedWithErrors, loadedSuccessfully }

class ViewModel {
  late Function loadingStateChanged;
  LoadingState isLoading = LoadingState.preloading;
  late String latitude;
  late String longitude;
  late String cityName;
  late String temperature;

  Future<void> apiCall(String city) async {
    try {
      isLoading = LoadingState.loading;
      loadingStateChanged();
      Response response = await get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=f3776047ead711ab4f0e8c88af6e8e0a'));
      dynamic decodedData = jsonDecode(response.body);
      Weather weather = Weather.fromWeather(decodedData);
      temperature = weather.temperature.toString() + 'F';
      longitude = weather.longitude.toString() + 'degrees';
      latitude = weather.latitude.toString() + 'degrees';
      cityName = city;
      isLoading = LoadingState.loadedSuccessfully;
      loadingStateChanged();
    } catch (e) {
      isLoading = LoadingState.loadedWithErrors;
      loadingStateChanged();
    }
  }
}

class TestViewModel extends ViewModel {
  @override
  Future<void> apiCall(String city) async {
    temperature = 'F';
    longitude = 'degrees';
    latitude = 'degrees';
    cityName = 'city';
    isLoading = await LoadingState.loadedSuccessfully;
    loadingStateChanged();
  }
}
