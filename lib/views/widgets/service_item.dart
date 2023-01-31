import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class ServiceItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final double? height, width;
  const ServiceItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: GlobalVariables.blackColor.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: GlobalVariables.accentColor,
              child: Icon(
                icon,
                size: 30,
              ),
            ),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: GlobalVariables.primaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
