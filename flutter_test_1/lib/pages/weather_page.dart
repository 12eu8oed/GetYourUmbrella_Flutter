import "package:flutter/material.dart";
import "package:flutter_test_1/models/weather_model.dart";
import "package:flutter_test_1/services/weather_serivce.dart";

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherSerivce = WeatherService('9821da20392d7c2a5a43e3121fd0ca00');
  Weather? _weather; // underscore => private

  // fetch weather
  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherSerivce.getCurrentCity(); //현재 도시이름 가지고 온다!

    // get weather for city
    try {
      final weather = await _weatherSerivce.getWeather(cityName); //cityName의 날씨를 가지고 온다.
      setState(() {
        _weather = weather;
      });

    // any errors
    } catch (e) {
      print(e);
    }
  }

  // weather animations

  // init state
  @override
  void initState() {
    super.initState();

    // fetch weather in startup
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // city name
            Text(_weather?.cityName ?? "loading city.."),

            // temperature
            Text('${_weather?.temperature.round()}°C')
          ],
        )
      )
    );
  }
}