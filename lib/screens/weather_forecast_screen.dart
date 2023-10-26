import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hello_flutter/api/weather_api.dart';
import 'package:hello_flutter/models/weather_forecast_daily.dart';
import 'package:hello_flutter/widgets/bottom_list_view.dart';
import 'package:hello_flutter/widgets/city_view.dart';
import 'package:hello_flutter/widgets/detail_view.dart';
import 'package:hello_flutter/widgets/temp_view.dart';

import 'city_screen.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;

  const WeatherForecastScreen({super.key, required this.locationWeather});

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  late Future<WeatherForecast> forecastObject;
  late String _cityName = 'Orenburg';

  @override
  void initState() {
    super.initState();
    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
    // forecastObject.then((weather) {
    //   print(weather.list?[0].weather?[0].main);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black87,
        title: const Text("Weather", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading:
            IconButton(color: Colors.white, icon: const Icon(Icons.my_location), onPressed: () {
              setState(() {
                forecastObject = WeatherApi().fetchWeatherForecast(cityName: "", isCity: false);
              });
            }),
        actions: <Widget>[
          IconButton(
              onPressed: () async {
                var tappedName = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return CityScreen();
                  }),
                );
                if (tappedName != null) {
                  _cityName = tappedName;
                  setState(() {
                    forecastObject = WeatherApi().fetchWeatherForecast(
                        cityName: _cityName, isCity: true);
                  });
                }
              },
              color: Colors.white,
              icon: const Icon(Icons.location_city)),
        ],
      ),
      body: FutureBuilder<WeatherForecast>(
        future: forecastObject,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                Column(
                  children: [
                    const SizedBox(height: 50.0),
                    CityView(snapshot: snapshot),
                    const SizedBox(
                      height: 50.0,
                    ),
                    TempView(snapshot: snapshot),
                    const SizedBox(
                      height: 50.0,
                    ),
                    DetailView(snapshot: snapshot),
                    const SizedBox(
                      height: 50.0,
                    ),
                    BottomListView(snapshot: snapshot),
                  ],
                )
              ],
            );
          } else {
            return const Center(
              child: Text(
                "City not found \nPlease, enter correct city",
                style: TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
