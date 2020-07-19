import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'location_screen.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getlocationdata();
  }

  void getlocationdata() async {
   var weatherdata= await WeatherModel().getweatherdata();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(locationweather: weatherdata);
    }));
    //option 2
    // doThis(value) {
    //   Navigator.push(context, MaterialPageRoute(builder: (context) {
    //     return LocationScreen(locationweather: value);
    //   }));
    // }

    // networkhelper.getdata().then((value) => doThis(value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
