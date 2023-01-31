import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class WeatherController extends GetxController {
  static WeatherController instance = Get.find();
  final String apiKey = 'fd835d6741dca5a27e0967178ce54497';
  final String baseUrl = 'http://api.openweathermap.org/data/2.5/weather';

  static var weather = {}.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _getWeather();
  }

  Future<void> _getWeather() async {
    isLoading.value = true;
    try {
      var status = await Permission.location.status;
      if (!status.isGranted) {
        await Permission.location.request();
      } else {
        Position position = await Geolocator.getCurrentPosition();
        double latitude = position.latitude;
        double longitude = position.longitude;
        final response = await http.get(
            Uri.parse('$baseUrl?lat=$latitude&lon=$longitude&appid=$apiKey'));
        weather.value = jsonDecode(response.body);
        print(weather);
      }
    } catch (exception) {
      debugPrint('catch block in WeatherController.getWeather(), $exception');
    }
    isLoading.value = false;
  }
}
