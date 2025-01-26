import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/rounded_textfield.dart';
import 'package:weather_app/constants/text_styles.dart';
import 'package:weather_app/views/famous_city_view.dart';
import 'package:weather_app/views/gradient_container.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
    ;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(
        children: [
          Column(
            children: [
              Text(
                'Pick A location',
                style: TextStyles.h1,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Find Area or City that you want to know the detailed Weather info at this time',
                style: TextStyles.subtitleText,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                child: RoundedTextfield(controller: _controller),
              ),
              SizedBox(
                width: 15,
              ),
              LocationIcon(),
            ],
          ),
          //FamouseCityview
          SizedBox(height: 30,),
          FamousCityView(),
        ],
      ),
    );
  }
}

class LocationIcon extends StatelessWidget {
  const LocationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.accentBlue,
      ),
      child: Icon(
        Icons.location_on_outlined,
        color: Colors.white,
      ),
    );
  }
}
