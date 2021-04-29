import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/location.dart';
import 'location_screen.dart';
import '../services/networking.dart';

const apiKey = 'a25b5d930f083f98113f18f1b6d4ea88';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double lat;
  double long;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    lat = location.lat;
    long = location.long;
    NetworkHelper networkHelper = NetworkHelper('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(
      locationWeather: weatherData,
    )));
  }

  @override
  Widget build(BuildContext context) {
    // getData();
    return Scaffold(
      body: Center(
        child: SpinKitCubeGrid(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
