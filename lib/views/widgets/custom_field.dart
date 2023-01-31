import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class CustomField extends StatelessWidget {
  final TextEditingController controller;
  final IconData prefixIcon;
  final String labelText;
  final bool isObscured;
  double borderRadius;
  VoidCallback? onSubmitted;
  CustomField({
    Key? key,
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
    this.isObscured = false,
    this.borderRadius = 5,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onSubmitted: (value) => onSubmitted!(),
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 0.8,
            color: GlobalVariables.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(
            color: GlobalVariables.borderColor,
          ),
        ),
      ),
      obscureText: isObscured,
    );
  }
}
