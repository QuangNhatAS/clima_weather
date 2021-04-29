import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import '../services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.locationWeather});
  final locationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;
  String message;
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    double temp = weatherData['main']['temp'];
    temperature = temp.toInt();
    var condition = weatherData['weather'][0]['id'];
    weatherIcon = weather.getWeatherIcon(condition);
    message = weather.getMessage(temperature);
    cityName = weatherData['name'];
    print(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Row(
                children: [
                  Text(
                    '$temperatureº',
                    style: kTempStyle,
                  ),
                  Text(
                    '$weatherIcon',
                    style: kTempStyle,
                  ),
                ],
              ),
            ),
            Text(
              '$message in $cityName',
              style: kCitynameStyle,
            ),
          ],
        ),
      ),
    ));
  }
}
