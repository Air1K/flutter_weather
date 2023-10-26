import 'package:flutter/material.dart';
import 'package:hello_flutter/screens/location_screen.dart';
import 'package:hello_flutter/screens/weather_forecast_screen.dart';

void main(){
  runApp(const MyMainWidget());
}

class MyMainWidget extends StatelessWidget {
  const MyMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Weather",
      // theme: ThemeData(
      //   useMaterial3: false,
      //   fontFamily: "Gabarito",
      //   primarySwatch: Colors.blueGrey,
      // ),
      home: LocationScreen(),
    );
  }
}