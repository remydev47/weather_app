import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/providers/get_weather_by_city_provider.dart';
import 'package:weather_app/utils/get_weather_icons.dart';

class FamousCityTile extends ConsumerWidget {
  FamousCityTile({required this.index, required this.city, super.key});
  final int index;
  final String city;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherData = ref.watch(weeklyWeatherByCityProvider(city));
    return weatherData.when(data: (weather) {
      return Material(
        color: index == 0 ? AppColors.lightBlue : AppColors.accentBlue,
        elevation: index == 0 ? 8 : 0,
        borderRadius: BorderRadius.circular(25),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${weather.main.temp.round().toString()}°',
                          style: TextStyles.h2,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          weather.weather[0].description,
                          style: TextStyles.subtitleText,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    getWeatherIcon(weatherCode: weather.weather[0].id),
                    width: 50,
                  )
                ],
              ),
              Text(
                weather.name,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white.withOpacity(.8),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
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
