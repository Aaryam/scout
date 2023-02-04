import 'package:flutter/material.dart';
import 'package:scout/misc/utilities.dart';
import 'package:scout/widgets/weatherboard.dart';
import 'package:scout/widgets/weathercard.dart';
import 'package:weather/weather.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 103, 165, 155),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder<List<Weather>>(
            future: WeatherUtils.getPersonalWeather(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Weather> forecast = snapshot.data as List<Weather>;

                return ListView(
                  physics: const BouncingScrollPhysics(),
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return WeatherBoard(
                            weatherText:
                                '${forecast[index].temperature!.celsius!.toStringAsFixed(1)}ºC',
                            contextText: StringUtils.getFormattedDate(
                                forecast[index].date as DateTime),
                          );
                        },
                        itemCount: forecast.length,
                        onPageChanged: (page) {
                          setState(() {
                            currentPage = page;
                          });
                        },
                      ),
                    ),
                    WeatherCard(
                        weatherIcon: Icons.lock_clock,
                        weatherTitle: "Time",
                        iconColor: const Color.fromARGB(255, 103, 165, 155),
                        weatherDetails: StringUtils.getFormattedTime(forecast[currentPage].date as DateTime),
                    ),
                    WeatherCard(
                        weatherIcon: Icons.cloud,
                        weatherTitle: "Cloud",
                        iconColor: const Color.fromARGB(255, 103, 165, 155),
                        weatherDetails:
                            '${forecast[currentPage].cloudiness!.toStringAsFixed(0)}%'),
                    WeatherCard(
                        weatherIcon: Icons.air,
                        weatherTitle: "Wind",
                        iconColor: const Color.fromARGB(255, 103, 165, 155),
                        weatherDetails:
                            '${forecast[currentPage.toInt()].windSpeed!.toStringAsFixed(1)} m/s'),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                return Container();
              }
            },
          ),
        ),
      ],
    );
  }
}
