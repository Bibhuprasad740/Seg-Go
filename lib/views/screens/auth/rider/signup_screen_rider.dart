import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/views/widgets/loading_button.dart';

import 'login_screen_rider.dart';
import '../../../../global_variables.dart';
import '../../../widgets/custom_field.dart';
import '../../../widgets/login_sugnup_button.dart';

class SignupScreenRider extends StatelessWidget {
  SignupScreenRider({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double mainPadding = size.width * 0.07;
    double betweenPadding = 15;
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
        child: SingleChildScrollView(
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
                        InkWell(
                          onTap: () =>
                              GlobalVariables.authController.pickImage(),
                          child: Stack(
                            children: [
                              GlobalVariables.authController.pickedImage == null
                                  ? CircleAvatar(
                                      radius: 60,
                                      backgroundImage: const NetworkImage(
                                        'https://as1.ftcdn.net/v2/jpg/04/43/35/28/1000_F_443352849_OnpiKV02hQG9h9mcuM4Zp3XBK2tsp3SB.jpg',
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.95),
                                    )
                                  : CircleAvatar(
                                      radius: 60,
                                      backgroundImage: FileImage(
                                        File(
                                          GlobalVariables.authController
                                              .pickedImage!.value!.path,
                                        ),
                                      ),
                                      backgroundColor:
                                          Colors.white.withOpacity(0.95),
                                    ),
                              const Positioned(
                                bottom: 0,
                                right: 0,
                                child: Icon(
                                  size: 40,
                                  Icons.add_a_photo,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: betweenPadding),
                        CustomField(
                          controller: _usernameController,
                          prefixIcon: Icons.person,
                          labelText: 'Username',
                        ),
                        SizedBox(height: betweenPadding),
                        CustomField(
                          controller: _emailController,
                          prefixIcon: Icons.email,
                          labelText: 'Email',
                        ),
                        SizedBox(height: betweenPadding),
                        CustomField(
                          controller: _passwordController,
                          prefixIcon: Icons.lock,
                          labelText: 'Password',
                          isObscured: true,
                          onSubmitted: () =>
                              GlobalVariables.authController.registerRider(
                            _usernameController.text.trim(),
                            _emailController.text.trim(),
                            _passwordController.text.trim(),
                            GlobalVariables.authController.pickedImage == null
                                ? null
                                : GlobalVariables
                                    .authController.pickedImage!.value,
                          ),
                        ),
                        const SizedBox(height: 30),
                        GlobalVariables.authController.isLoading.value == true
                            ? const LoadingButton(height: 50)
                            : LoginSignupButton(
                                onTap: () => GlobalVariables.authController
                                    .registerRider(
                                  _usernameController.text.trim(),
                                  _emailController.text.trim(),
                                  _passwordController.text.trim(),
                                  GlobalVariables.authController.pickedImage ==
                                          null
                                      ? null
                                      : GlobalVariables
                                          .authController.pickedImage!.value,
                                ),
                                height: 50,
                                label: 'Get Started!',
                              ),
                        const SizedBox(height: 50),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have account? ',
                              style: TextStyle(
                                fontSize: 16,
                                color: GlobalVariables.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(
                              onTap: () => Get.offAll(() => LoginScreenRider()),
                              child: const Text(
                                'Login',
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
              )
            ],
          ),
        ),
      ),
    ));
  }
}
