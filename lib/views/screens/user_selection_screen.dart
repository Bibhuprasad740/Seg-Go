import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/screens/auth/driver/login_screen_driver.dart';
import 'package:vidmo/views/screens/auth/rider/login_screen_rider.dart';
import 'package:vidmo/views/widgets/custom_button.dart';

class UserSelectionScreen extends StatefulWidget {
  const UserSelectionScreen({Key? key}) : super(key: key);

  @override
  _UserSelectionScreenState createState() => _UserSelectionScreenState();
}

class _UserSelectionScreenState extends State<UserSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(size.width * 0.07),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(GlobalVariables.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        alignment: Alignment.center,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4,
            sigmaY: 4,
          ),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: size.height * 0.05,
            ),
            decoration: BoxDecoration(
              color: GlobalVariables.primaryTextColor.withOpacity(0.49),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: GlobalVariables.primaryTextColor,
                width: 1,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ALLO-EV',
                  style: TextStyle(
                    fontSize: 35,
                    color: GlobalVariables.buttonColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 50),
                const Text(
                  'Are you a',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      onTap: () => Get.to(() => LoginScreenRider()),
                      title: 'Rider',
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'or',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    CustomButton(
                      onTap: () => Get.to(() => LoginScreenDriver()),
                      title: 'Driver',
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
