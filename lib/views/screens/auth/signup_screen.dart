import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/views/screens/auth/login_screen.dart';
import '../../../global_variables.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/login_sugnup_button.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

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
                'VEHICLE',
                style: TextStyle(
                  fontSize: 35,
                  color: GlobalVariables.buttonColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: size.height * 0.1),
              InkWell(
                onTap: () => GlobalVariables.authController.pickImage(),
                child: Stack(
                  children: [
                    GlobalVariables.authController.pickedImage == null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: const NetworkImage(
                              'https://as1.ftcdn.net/v2/jpg/04/43/35/28/1000_F_443352849_OnpiKV02hQG9h9mcuM4Zp3XBK2tsp3SB.jpg',
                            ),
                            backgroundColor: Colors.white.withOpacity(0.95),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(
                              File(
                                GlobalVariables
                                    .authController.pickedImage!.value!.path,
                              ),
                            ),
                            backgroundColor: Colors.white.withOpacity(0.95),
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
                onSubmitted: () => GlobalVariables.authController.register(
                  _usernameController.text.trim(),
                  _emailController.text.trim(),
                  _passwordController.text.trim(),
                  GlobalVariables.authController.pickedImage == null
                      ? null
                      : GlobalVariables.authController.pickedImage!.value,
                ),
              ),
              const SizedBox(height: 30),
              GlobalVariables.authController.isLoading.value == true
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : LoginSignupButton(
                      onTap: () => GlobalVariables.authController.register(
                        _usernameController.text.trim(),
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                        GlobalVariables.authController.pickedImage == null
                            ? null
                            : GlobalVariables.authController.pickedImage!.value,
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
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.offAll(() => LoginScreen()),
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
    ));
  }
}
