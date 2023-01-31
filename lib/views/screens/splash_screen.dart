import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/screens/auth/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Get.off(() => LoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            const CircleAvatar(
              radius: 60,
              backgroundColor: GlobalVariables.accentColor,
              child: Icon(
                Icons.electric_bike,
                size: 50,
                color: GlobalVariables.primaryTextColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Seg-Go',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: (16 - _animation.value * 7 as double),
                color: GlobalVariables.accentColor,
              ),
            ),
            const Expanded(child: SizedBox()),
            const Text(
              '@All rights reserved',
              style: TextStyle(
                color: GlobalVariables.secondaryTextColor,
                letterSpacing: 3,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
