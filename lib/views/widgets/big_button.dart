import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class BigButton extends StatelessWidget {
  final double width;
  final String text;
  final VoidCallback onTap;
  const BigButton({
    Key? key,
    required this.width,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      alignment: Alignment.center,
      width: width,
      decoration: BoxDecoration(
        color: GlobalVariables.accentColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: InkWell(
        onTap: onTap,
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
