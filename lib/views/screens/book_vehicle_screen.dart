import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vidmo/views/widgets/custom_button.dart';
import 'package:vidmo/views/widgets/custom_field.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../../global_variables.dart';

class BookVehicleScreen extends StatefulWidget {
  const BookVehicleScreen({Key? key}) : super(key: key);

  @override
  State<BookVehicleScreen> createState() => _BookVehicleScreenState();
}

class _BookVehicleScreenState extends State<BookVehicleScreen> {
  final TextEditingController _vehicleIdController = TextEditingController();

  @override
  void dispose() {
    _vehicleIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Start Your Journey',
          style: TextStyle(
            color: GlobalVariables.primaryTextColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: Column(
          children: [
            CustomField(
              controller: _vehicleIdController,
              prefixIcon: Icons.done,
              labelText: 'Enter vehicle id to verify',
              borderRadius: 25,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    onTap: GlobalVariables.transactionController.qrData,
                    title: 'Scan QR code'),
                const SizedBox(width: 10),
                CustomButton(onTap: () {}, title: 'Verify'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
