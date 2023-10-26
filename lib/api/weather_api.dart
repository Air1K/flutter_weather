import 'dart:convert';
import 'dart:developer';

import 'package:hello_flutter/utils/location.dart';
import 'package:http/http.dart' as http;
import '../models/weather_forecast_daily.dart';
import '../utils/constants.dart';
class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast({required String cityName, required bool? isCity}) async {

    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters;

    if(isCity == true){
      var queryParameters = {
        'APPID' : Constants.WEATHER_APP_ID,
        'units' : 'metric',
        'q' : cityName,
      };
      parameters = queryParameters;
      print("true");
    } else {
      var queryParameters = {
        'APPID' : Constants.WEATHER_APP_ID,
        'units' : 'metric',
        'lat' : location.latitude.toString(),
        'lon' : location.longitude.toString(),
      };
      parameters = queryParameters;
      print("else");
    }


    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, parameters);
    log('request: ${uri.toString()}');
    var response = await http.get(uri);
    print('response: ${response?.body}');
    print(parameters);
    if(response.statusCode == 200){
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error response');
    }
  }
}