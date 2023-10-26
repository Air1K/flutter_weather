import 'package:hello_flutter/utils/constants.dart';

class WeatherForecast {
  String? cod;
  dynamic message;
  City? city;
  dynamic cnt;
  late List<WeatherList> list;

  WeatherForecast({this.cod, this.message, this.city, this.cnt, required this.list});

  WeatherForecast.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    message = json['message'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    cnt = json['cnt'];
      list = <WeatherList>[];
      json['list'].forEach((v) {
        list!.add(new WeatherList.fromJson(v));
      });

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['message'] = this.message;
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    data['cnt'] = this.cnt;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  dynamic geonameId;
  String? name;
  dynamic lat;
  dynamic lon;
  String? country;
  String? iso2;
  String? type;
  int? population;

  City(
      {this.geonameId,
        this.name,
        this.lat,
        this.lon,
        this.country,
        this.iso2,
        this.type,
        this.population});

  City.fromJson(Map<String, dynamic> json) {
    geonameId = json['geoname_id'];
    name = json['name'];
    lat = json['lat'];
    lon = json['lon'];
    country = json['country'];
    iso2 = json['iso2'];
    type = json['type'];
    population = json['population'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['geoname_id'] = this.geonameId;
    data['name'] = this.name;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['country'] = this.country;
    data['iso2'] = this.iso2;
    data['type'] = this.type;
    data['population'] = this.population;
    return data;
  }
}

class WeatherList {
  dynamic dt;
  Temp? temp;
  dynamic pressure;
  dynamic humidity;
  late List<Weather> weather;
  dynamic speed;
  dynamic deg;
  dynamic clouds;
  dynamic rain;
  dynamic snow;

  WeatherList(
      {this.dt,
        this.temp,
        this.pressure,
        this.humidity,
        required this.weather,
        this.speed,
        this.deg,
        this.clouds,
        this.rain,
        this.snow});

  WeatherList.fromJson(Map<String, dynamic> json) {
    dt = json['dt'];
    temp = json['temp'] != null ? new Temp.fromJson(json['temp']) : null;
    pressure = json['pressure'];
    humidity = json['humidity'];
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(new Weather.fromJson(v));
      });
    }
    speed = json['speed'];
    deg = json['deg'];
    clouds = json['clouds'];
    rain = json['rain'];
    snow = json['snow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    if (this.temp != null) {
      data['temp'] = this.temp!.toJson();
    }
    data['pressure'] = this.pressure;
    data['humidity'] = this.humidity;
    if (this.weather != null) {
      data['weather'] = this.weather!.map((v) => v.toJson()).toList();
    }
    data['speed'] = this.speed;
    data['deg'] = this.deg;
    data['clouds'] = this.clouds;
    data['rain'] = this.rain;
    data['snow'] = this.snow;
    return data;
  }
  String getIconUrl(){
    return Constants.WEATHER_IMAGE_URL + weather[0].icon + ".png";
  }
}

class Temp {
  dynamic day;
  dynamic min;
  dynamic max;
  dynamic night;
  dynamic eve;
  dynamic morn;

  Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

  Temp.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    min = json['min'];
    max = json['max'];
    night = json['night'];
    eve = json['eve'];
    morn = json['morn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}

class Weather {
  dynamic id;
  String? main;
  String? description;
  late String icon;

  Weather({this.id, this.main, this.description, required this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }

}