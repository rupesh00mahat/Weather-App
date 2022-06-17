import 'package:flutter/material.dart';
import 'package:weather_mvc/ViewModel/viewModel.dart';
import 'package:weather_mvc/view/display_weather.dart';
import 'package:weather_mvc/view/user_input.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: UserInputComposer.compose(),
      ),
    );
  }
}

class UserInputComposer {
  static UserInput compose() {
    TestViewModel viewModel = TestViewModel();
    DisplayWeather displayWeather = DisplayWeather(viewModel: viewModel);
    var uInput = UserInput(displayWeather: displayWeather);
    uInput.onTap = (String city, BuildContext context) {
      displayWeather.cityName = city;

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => displayWeather));
    };
    return uInput;
  }
}
