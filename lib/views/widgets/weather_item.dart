import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class WeatherItem extends StatelessWidget {
  final Widget widget;
  final String text;
  const WeatherItem({
    Key? key,
    required this.widget,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      decoration: BoxDecoration(
        color: GlobalVariables.primaryTextColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: GlobalVariables.accentColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          const SizedBox(height: 10),
          Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              color: GlobalVariables.accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
