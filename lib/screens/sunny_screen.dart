import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/extensions/datetime.dart';
import 'package:weather_app/views/gradient_container.dart';
import 'package:weather_app/views/hourly_forecast_weather.dart';
import 'package:weather_app/views/weekly_forecast.dart';

class ForeCast extends StatelessWidget {
  const ForeCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'ForeCast Report',
              style: TextStyles.h1,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today',
                style: TextStyles.h2,
              ),
              Text(DateTime.now().dateTime)
            ],
          ),
          SizedBox(
            height: 20,
          ),
          HourlyForecastView(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Next Week Forecast',
                style: TextStyles.h1,
              ),
              Icon(
                Icons.calendar_month,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          WeeklyForecast(),
        ],
      ),
    );
  }
}
