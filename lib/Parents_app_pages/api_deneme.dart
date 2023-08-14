import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiCall {
  var request = http.Request(
      'GET',
      Uri.parse(
          'https://api.open-meteo.com/v1/forecast?latitude=35&longitude=139&current_weather=true'));

  // getWeather() async {
  //   http.StreamedResponse response = await request.send();
  //
  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }

  Future<WeatherData?> getWeather() async {
    final url = Uri.parse(
        "https://api.open-meteo.com/v1/forecast?latitude=35.0&longitude=139.0&current_weather=true");

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);

      WeatherData weatherData = WeatherData.fromJson(jsonData);
      print(weatherData.currentWeather.temperature);
      return weatherData;
    } else {
      return null;
    }
  }
}

class WeatherData {
  final double latitude;
  final double longitude;
  final double generationTimeMs;
  final int utcOffsetSeconds;
  final String timezone;
  final String timezoneAbbreviation;
  final double elevation;
  final CurrentWeather currentWeather;

  WeatherData({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeather,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      latitude: json['latitude'],
      longitude: json['longitude'],
      generationTimeMs: json['generationtime_ms'],
      utcOffsetSeconds: json['utc_offset_seconds'],
      timezone: json['timezone'],
      timezoneAbbreviation: json['timezone_abbreviation'],
      elevation: json['elevation'],
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}

class CurrentWeather {
  final double temperature;
  final double windSpeed;
  final double windDirection;
  final int weatherCode;
  final int isDay;
  final DateTime time;

  CurrentWeather({
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.weatherCode,
    required this.isDay,
    required this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      temperature: json['temperature'],
      windSpeed: json['windspeed'],
      windDirection: json['winddirection'],
      weatherCode: json['weathercode'],
      isDay: json['is_day'],
      time: DateTime.parse(json['time']),
    );
  }
}
