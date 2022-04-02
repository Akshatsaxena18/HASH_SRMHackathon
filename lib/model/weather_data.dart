import 'dart:convert';
import 'package:hash_srm/model/getCity.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherData {
  static late WeatherLocations weather;
  static Future<void> getWeather() async {
    print('getting weather');
    weather = await fetchWeather();
  }
}
class WeatherLocations {


  final String city;
  final String dateTime;
  final String temperature;
  final String weatherType;
  final String iconUrl;
  final num wind;
  final num cloud;
  final num pressure;
  final num humidity;
  final num latitude;
  final num longitude;

  WeatherLocations({
    required this.cloud,
    required this.city,
    required this.dateTime,
    required this.temperature,
    required this.weatherType,
    required this.iconUrl,
    required this.wind,
    required this.pressure,
    required this.humidity,
    required this.latitude,
    required this.longitude
  });

  factory WeatherLocations.fromJson(Map<String, dynamic> json) {
    DateTime now = DateTime.now();
    String dateTime = DateFormat('kk:mm - EEE , d MMM 2021').format(now);
    return WeatherLocations(
        city: json["name"],
        dateTime: dateTime,
        temperature: (json['main']['temp']-273.15).toStringAsFixed(2),
        weatherType: json['weather'][0]['main'],
        wind: json['wind']['speed'],
        cloud: json["clouds"]["all"],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
        iconUrl: json['weather'][0]['icon'],
        latitude: json['coord']['lat'],
        longitude: json['coord']['lon']
    );
  }
}

Future<WeatherLocations> fetchWeather() async {
  WeatherLocations weather;
  String city = await getCity();
  String apiKey = "f74917363ea01c303f930d140c4833b1";
  var url = "https://api.openweathermap.org/data/2.5/weather?q=$city,in&appid=$apiKey";

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      weather = WeatherLocations.fromJson(jsonDecode(response.body));
      return weather;
    } else {
      print("Exception occurred");
      throw Exception('Failed to load Weather!!');
    }
  } on Exception catch (e) {
    // TODO
    print(e.toString());
    return new WeatherLocations(cloud: 0,
        city: city, dateTime: "",
        temperature: "",
        weatherType: "",
        iconUrl: "",
        wind: 0,
        pressure: 0,
        humidity: 0,
        latitude: 0,
        longitude: 0
    );
  }
}
