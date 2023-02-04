import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String weatherTitle;
  final String weatherDetails;
  final IconData weatherIcon;
  final Color iconColor;

  const WeatherCard(
      {super.key,
      required this.weatherIcon,
      required this.weatherTitle,
      required this.iconColor,
      required this.weatherDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color.fromARGB(255, 109, 179, 167),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(30),
              child: Icon(
                weatherIcon,
                size: 70,
                color: iconColor,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  weatherTitle,
                  style: const TextStyle(
                    fontSize: 24,
                    fontFamily: 'JosefinSans',
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                Text(
                  weatherDetails,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'JosefinSans',
                    color: Color.fromARGB(255, 218, 218, 218),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
