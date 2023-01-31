import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/controllers/bindings/initial_binding.dart';
import '/controllers/auth_controller.dart';
import '/controllers/storage_controller.dart';
import '/global_variables.dart';
import '/views/screens/auth/login_screen.dart';
import '/views/screens/auth/signup_screen.dart';

void main() async {
  // change_app_package_name => flutter pub run change_app_package_name:main //package name

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Seg-Go',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: GlobalVariables.accentColor,
          centerTitle: true,
        ),
        //GetX snakbar color depends upon material app's IconThemeData!
        iconTheme: const IconThemeData(
          color: GlobalVariables.primaryTextColor,
        ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.grey,
        ),
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
      ),
      initialBinding: InitialBinding(),
      home: LoginScreen(),
    );
  }
}
