import 'package:flutter/material.dart';

import '../../global_variables.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  const CustomButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: GlobalVariables.accentColor,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          title,
          style: const TextStyle(
            color: GlobalVariables.primaryTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
