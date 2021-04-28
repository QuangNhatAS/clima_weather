import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../services/location.dart';

const apiKey = 'a25b5d930f083f98113f18f1b6d4ea88';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    // getLocation();
    getWeather();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    
  }

  void getWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    var url = Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=${location.lat}&lon=${location.long}&appid=$apiKey');
    var response = await http.get(url);
    var weatherData = convert.jsonDecode(response.body);
    print(weatherData);
    print(weatherData['main']['temp']);
    print(weatherData['weather'][0]['main']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
