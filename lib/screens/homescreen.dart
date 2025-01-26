import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/screens/search_screen.dart';
import 'package:weather_app/screens/setting_screen.dart';
import 'package:weather_app/screens/sunny_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int _currentPageIndex = 0;
  final _destinations = [
    NavigationDestination(
      icon: Icon(
        Icons.home_outlined,
        color: Colors.white,
      ),
      label: 'home',
      selectedIcon: Icon(
        Icons.home,
        color: Colors.white,
      ),
    ),
    NavigationDestination(
      icon: Icon(
        Icons.search_outlined,
        color: Colors.white,
      ),
      label: 'home',
      selectedIcon: Icon(
        Icons.search,
        color: Colors.white,
      ),
    ),
    NavigationDestination(
      icon: Icon(
        Icons.wb_sunny_outlined,
        color: Colors.white,
      ),
      label: 'home',
      selectedIcon: Icon(
        Icons.wb_sunny,
        color: Colors.white,
      ),
    ),
    NavigationDestination(
      icon: Icon(
        Icons.settings_outlined,
        color: Colors.white,
      ),
      label: 'home',
      selectedIcon: Icon(
        Icons.settings,
        color: Colors.white,
      ),
    ),
  ];
  final _screens = [
    WeatherScreen(),
    SearchScreen(),
    ForeCast(),
    SettingScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _screens[_currentPageIndex],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            backgroundColor: AppColors.secondaryBlack,
          ),
          child: NavigationBar(
            destinations: _destinations,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            selectedIndex: _currentPageIndex,
            indicatorColor: Colors.transparent,
            onDestinationSelected: (index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
          ),
        ));
  }
}
