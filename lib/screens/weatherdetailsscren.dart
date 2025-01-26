import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/datetime.dart';
import 'package:weather_app/extensions/strings.dart';
import 'package:weather_app/providers/get_weather_by_city_provider.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/weather_info.dart';

class WeatherDetailsScreen extends ConsumerWidget {
  WeatherDetailsScreen({required this.cityName, super.key});
  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weeklyWeatherByCityProvider(cityName));

    return weatherData.when(data: (weather) {
      return GradientContainer(
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                weather.name,
                style: TextStyles.h1,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                DateTime.now().dateTime,
                style: TextStyles.subtitleText,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 260,
                child: Image.asset(
                  'assets/icons/${weather.weather[0].icon.replaceAll('n', 'd')}.png',
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            weather.weather[0].description.capitalize,
            style: TextStyles.h2,
          ),
          SizedBox(
            height: 40,
          ),
          WeatherInfo(
            weather: weather,
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 15,
          ),
        ],
      );
    }, error: (error, stackTrace) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
