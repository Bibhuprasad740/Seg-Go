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
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        backgroundColor: GlobalVariables.blackColor.withOpacity(0.5),
      ),
      child: Text(
        title,
        style: const TextStyle(color: GlobalVariables.accentColor),
      ),
    );
  }
}
