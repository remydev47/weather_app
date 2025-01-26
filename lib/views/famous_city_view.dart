import 'package:flutter/material.dart';
import 'package:weather_app/models/famous_city.dart';
import 'package:weather_app/screens/weatherdetailsscren.dart';
import 'package:weather_app/widgets/famous_city_tile.dart';

class FamousCityView extends StatelessWidget {
  const FamousCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: famousCities.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        final city = famousCities[index];

        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => WeatherDetailsScreen(cityName:city.name)
              )
            );
          },
          child: FamousCityTile(
            index: index,
            city: city.name,
          ),
        );
      },
    );
  }
}
