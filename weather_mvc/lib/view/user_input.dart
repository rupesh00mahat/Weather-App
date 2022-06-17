import 'package:flutter/material.dart';
import 'package:weather_mvc/ViewModel/viewModel.dart';
import 'package:weather_mvc/loader/loader.dart';
import 'package:weather_mvc/view/display_weather.dart';

class UserInput extends StatelessWidget {
  late Function onTap;
  final DisplayWeather displayWeather;

  UserInput({Key? key, required this.displayWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String userInput = '';
    return Center(
      child: Container(
        padding: EdgeInsets.all(10.0),
        height: 200,
        width: 500,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                userInput = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  onTap(userInput, context);
                },
                child: const Text("Find out the weather"))
          ],
        ),
      ),
    );
  }
}
