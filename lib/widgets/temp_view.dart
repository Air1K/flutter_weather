import 'package:flutter/material.dart';
import '../models/weather_forecast_daily.dart';

class TempView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;

  const TempView({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data?.list;
    var icon = forecastList?[0].getIconUrl();
    var temp = forecastList?[0].temp?.day.toStringAsFixed(0);
    var description = forecastList?[0].weather[0].description;
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon.toString(), scale: 0.4,),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            children: [
              Text(
                '$temp °C',
                style: TextStyle(fontSize: 54.0, color: Colors.black87),
              ),
              Text('$description', style: TextStyle(fontSize: 18.0, color: Colors.black87),),
            ],
          )
        ],
      ),
    );
  }
}
