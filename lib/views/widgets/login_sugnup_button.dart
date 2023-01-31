import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class LoginSignupButton extends StatelessWidget {
  final double height;
  final String label;
  final VoidCallback onTap;
  const LoginSignupButton({
    Key? key,
    required this.height,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: GlobalVariables.buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: GlobalVariables.backgroundColor,
          ),
        ),
      ),
    );
  }
}
