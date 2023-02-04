import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:weather/weather.dart';

class WeatherUtils {
  static Future<List<Weather>> getPersonalWeather() async {
    print('helloo');
    // LocationData currentLocation = await LocationUtils.getCurrentLocation();
    print('hello');

    WeatherFactory wf = WeatherFactory("8f3589f6bd9e47e09438c4d88d697607");
    List<Weather> forecast = await wf.fiveDayForecastByLocation(20.3533, 85.8266);
        /*currentLocation.latitude as double,
        currentLocation.longitude as double);*/

    return forecast;
  }
}

class LocationUtils {
  static Future<LocationData> getCurrentLocation() async {
    LocationData currentLocation = await Location.instance.getLocation();

    return currentLocation;
  }
}

class StringUtils {
  static String getFormattedDate(DateTime date) {
    final day = date.day.toString();
    final month = date.month;
    String monthName = "";
    switch (month) {
      case 1:
        monthName = "January";
        break;
      case 2:
        monthName = "February";
        break;
      case 3:
        monthName = "March";
        break;
      case 4:
        monthName = "April";
        break;
      case 5:
        monthName = "May";
        break;
      case 6:
        monthName = "June";
        break;
      case 7:
        monthName = "July";
        break;
      case 8:
        monthName = "August";
        break;
      case 9:
        monthName = "September";
        break;
      case 10:
        monthName = "October";
        break;
      case 11:
        monthName = "November";
        break;
      case 12:
        monthName = "December";
        break;
    }

    return "$day${day.endsWith("1") ? "st" : day.endsWith("2") ? "nd" : day.endsWith("3") ? "rd" : "th"} $monthName";
  }

  static String getFormattedTime(DateTime date) {
    int hour = date.hour;
    final minute = date.minute.toString();

    print(hour);

    bool isAfternoon = hour > 12;
    hour = isAfternoon ? hour -= 12 : hour;

    return isAfternoon ? "$hour:$minute PM" : "$hour:$minute AM";
  }
}
