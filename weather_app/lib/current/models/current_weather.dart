import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void fetchWeatherData(place) async {
  final String apiKey = "7075d2bb49d54bea892174538230811";
  final String city = place;
  final String apiUrl =
      "http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$city&aqi=no";

  try {
    // Make the HTTP request
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      Map<String, dynamic> data = json.decode(response.body);

      // Now you can access the weather data in the 'data' variable
      double temperature = data['current']['temp_c'];
      //print("Temperature in your city: ${data['current']['temp_c']}°C");
    } else {
      // If the server did not return a 200 OK response, throw an exception.
      throw Exception(
          "Failed to load weather data. Status code: ${response.statusCode}");
      //print("Failed to load weather data. Status code: ${response.statusCode}");
    }
  } catch (error) {
    // Handle any errors that occurred during the HTTP request
    throw Exception("Error: $error");
    //print("Error: $error");
  }
}
