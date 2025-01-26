import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/constants/constants.dart';
import 'package:weather_app/models/hourly_weather.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/models/weekly_weather.dart';
import 'package:weather_app/services/geolocatator.dart';
import 'package:weather_app/utils/logging.dart';

@immutable
class ApiHelper {
  static const baseUrl = 'https://api.openweathermap.org/data/2.5';
  static const weeklyWeatherUrl =
      'https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m';

  static double lat = 0.0;
  static double lon = 0.0;
  static final dio = Dio();

  static Future<void> fetchLocation() async {
    final location = await getLocation();
    lat = location.latitude;
    lon = location.longitude;
  }

  static Future<Weather> getCurrentWeather() async{
    await fetchLocation();
    final url = _constructWeatherUrl();
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }

  static Future<HourlyWeather> getHourlyForeCast() async {
    await fetchLocation();
    final url = _constructForecastUrl();
    final response = await _fetchData(url);
    return HourlyWeather.fromJson(response);
  }

  static Future<WeeklyWeather> getWeeklyForecast() async {
    await fetchLocation();
    final url = _constructWeeklyForeCastUrl();
    final response = await _fetchData(url);
    return WeeklyWeather.fromJson(response);
  }
  //Weather by City Name
  static Future<Weather> getWeatherByCityName({
    required String cityName,
  }) async{
    final url = _constructWeatheByCityUrl(cityName);
    final response = await _fetchData(url);
    return Weather.fromJson(response);
  }


  static String _constructWeatherUrl() =>
      '$baseUrl/weather?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructForecastUrl() =>
      '$baseUrl/forecast?lat=$lat&lon=$lon&units=metric&appid=${Constants.apiKey}';

  static String _constructWeatheByCityUrl(String cityName) =>
      '$baseUrl/weather?q=$cityName&units=metric&appid=${Constants.apiKey}';

  
  static String _constructWeeklyForeCastUrl() =>
      '$weeklyWeatherUrl&latitude=$lat&longitude=$lon';

  //*Fetch Date for a URL

 static Future<Map<String, dynamic>> _fetchData(String url ) async {
  try {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      printWarning('Failed to Load data: ${response.statusCode}');
      throw Exception('Failed to Load data');
    }
  } catch (e) {
    printWarning('Error fetching data from $url: $e');
    throw Exception('Error fetching data');
  }
 }
}
