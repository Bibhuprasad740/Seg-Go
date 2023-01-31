import 'package:flutter/material.dart';
import 'package:vidmo/global_variables.dart';

class AddVehicleScreen extends StatelessWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Register a new vehicle',
          style: TextStyle(
            color: GlobalVariables.primaryTextColor,
          ),
        ),
        backgroundColor: GlobalVariables.accentColor,
      ),
    );
  }
}
