import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_mvc/ViewModel/viewModel.dart';
import 'package:weather_mvc/model/get_weather_information.dart';

class DisplayWeather extends StatefulWidget {
  final ViewModel viewModel;
  late String cityName;

  DisplayWeather({Key? key, required this.viewModel}) : super(key: key);
  @override
  State<DisplayWeather> createState() => _DisplayWeatherState();
}

class _DisplayWeatherState extends State<DisplayWeather> {
  LoadingState isLoading = LoadingState.preloading;

  @override
  void initState() {
    super.initState();
    widget.viewModel.loadingStateChanged = () {
      setState(() {
        isLoading = widget.viewModel.isLoading;
      });
    };
    widget.viewModel.apiCall(widget.cityName);
  }

  @override
  Widget build(BuildContext context) {
    switch (isLoading) {
      case LoadingState.loadedSuccessfully:
        return MaterialApp(
          home: Scaffold(
            body: Container(
              color: Colors.black,
              child: Column(
                children: [
                  Container(
                    color: Colors.grey,
                    padding: EdgeInsets.all(10.0),
                    child: Text(widget.viewModel.cityName,
                        style: const TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Latitude: ${widget.viewModel.latitude}'),
                      ),
                      Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Longitude: ${widget.viewModel.longitude}'),
                      ),
                      Container(
                        color: Colors.grey,
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            'Temperature: ${widget.viewModel.temperature}'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );

      case LoadingState.loading:
        return Text("Loading");
      case LoadingState.loadedWithErrors:
        return Text("Error while loading");
      default:
        return Text("Default case");
    }
  }
}

class $ {}
