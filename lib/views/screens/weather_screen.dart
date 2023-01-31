import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/widgets/service_item.dart';
import 'package:vidmo/views/widgets/weather_item.dart';

import '../../controllers/weather_controller.dart';

class WeatherScreen extends StatelessWidget {
  WeatherScreen({super.key});
  WeatherController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () {
          var weather = WeatherController.weather;
          return controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 30,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.05),
                      Text(
                        weather['name'],
                        style: const TextStyle(
                          color: GlobalVariables.primaryTextColor,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weather['weather'][0]['main'] + ': ',
                            style: const TextStyle(
                              color: GlobalVariables.secondaryTextColor,
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          Text(
                            weather['weather'][0]['description'],
                            style: const TextStyle(
                              color: GlobalVariables.secondaryTextColor,
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Nunito',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                          'assets/images/${GlobalVariables.weatherPngs[1]}')
                    ],
                  ),
                );
        },
      ),
    );
  }
}

/**
 * Column(
            children: <Widget>[
              // Text("Temperature: $temperature °C"),
              // Text("Condition: $condition"),
              // Text("Location: $location"),
            ],
          );
 * 
 * var weather = WeatherController().weather;
            var temperature = weather['main']['temp'];
            var condition = weather['weather'][0]['id'];
            var location = weather['name'];
 */
