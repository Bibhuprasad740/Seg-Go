import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';
import 'package:vidmo/views/screens/auth/rider/signup_screen_rider.dart';
import 'package:vidmo/views/widgets/custom_field.dart';
import 'package:vidmo/views/widgets/loading_button.dart';
import 'package:vidmo/views/widgets/login_sugnup_button.dart';

class LoginScreenRider extends StatelessWidget {
  LoginScreenRider({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double mainPadding = size.width * 0.07;
    return Scaffold(
        body: Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: mainPadding),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(GlobalVariables.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'RIDER',
              style: TextStyle(
                fontSize: 35,
                color: GlobalVariables.buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4,
                sigmaY: 3,
              ),
              child: SizedBox(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: GlobalVariables.primaryTextColor.withOpacity(0.49),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: GlobalVariables.primaryTextColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 25,
                          color: GlobalVariables.buttonColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 25),
                      CustomField(
                        controller: _emailController,
                        prefixIcon: Icons.email,
                        labelText: 'Email',
                      ),
                      const SizedBox(height: 25),
                      CustomField(
                        controller: _passwordController,
                        prefixIcon: Icons.lock,
                        labelText: 'Password',
                        isObscured: true,
                        onSubmitted: () => GlobalVariables.authController.login(
                          _emailController.text.trim(),
                          _passwordController.text.trim(),
                        ),
                      ),
                      const SizedBox(height: 30),
                      GlobalVariables.authController.isLoading.value == true
                          ? const LoadingButton(height: 50)
                          : LoginSignupButton(
                              onTap: () => GlobalVariables.authController.login(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                              ),
                              height: 50,
                              label: 'Login',
                            ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t have account? ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: GlobalVariables.blackColor,
                            ),
                          ),
                          InkWell(
                            onTap: () => Get.to(() => SignupScreenRider()),
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: GlobalVariables.accentColor,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
