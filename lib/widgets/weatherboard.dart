import 'package:flutter/material.dart';
import 'package:scout/misc/utilities.dart';

class WeatherBoard extends StatelessWidget {

    final String weatherText;
    final String contextText;

  const WeatherBoard({super.key, required this.weatherText, required this.contextText});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 109, 179, 167),
          ),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(weatherText, style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontFamily: 'JosefinSans',
                ),),
                Text(contextText, style: const TextStyle(
                  color: Color.fromARGB(255, 218, 218, 218),
                  fontSize: 14,
                  fontFamily: 'JosefinSans',
                ),),
              ],
            ),
          ),
        ),
      ),
      onTap: () async {
        WeatherUtils.getPersonalWeather();
      },
    );
  }
}
