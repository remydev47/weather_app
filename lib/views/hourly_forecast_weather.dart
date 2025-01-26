import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extensions/int.dart';
import 'package:weather_app/providers/hourly_weather_provider.dart';
import 'package:weather_app/views/hourly_forecast_tile.dart';

class HourlyForecastView extends ConsumerWidget {
  const HourlyForecastView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyWeatherData = ref.watch(hourlyWeatherProvider);
    return hourlyWeatherData.when(data: (hourlyWeather) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: hourlyWeather.cnt,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final weather = hourlyWeather.list[index];
        
            return HourlyForecastTile(
              id: weather.weather[0].id,
              hour: weather.dt.time,
              temp: weather.main.temp.round(),
              isActive: index == 0,
            );
          },
        ),
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
