import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:vidmo/controllers/auth_controller.dart';
import 'package:vidmo/controllers/firestore_controller.dart';
import 'package:vidmo/controllers/storage_controller.dart';
import 'package:vidmo/controllers/transaction_controller.dart';
import 'package:vidmo/controllers/weather_controller.dart';
import 'package:vidmo/models/user.dart';
import 'package:vidmo/views/screens/add_vehicle_screen.dart';
import 'package:vidmo/views/screens/weather_screen.dart';
import 'package:vidmo/views/screens/profile_screen.dart';
import 'package:vidmo/views/screens/transaction_history_screen.dart';

import 'views/screens/home_screen.dart';

class GlobalVariables {
  //appwide colors
  static const backgroundColor = Color.fromARGB(255, 43, 42, 42);
  static const blackColor = Colors.black;
  static const buttonColor = Color.fromARGB(255, 255, 153, 0);
  static const borderColor = Colors.grey;
  static const accentColor = Color.fromARGB(255, 255, 153, 0);
  static const primaryTextColor = Colors.white;
  static const secondaryTextColor = Colors.grey;

  //appwide images
  static const backgroundImage = 'assets/images/background.jpg';
  static const defaultAvatar =
      'https://as1.ftcdn.net/v2/jpg/04/43/35/28/1000_F_443352849_OnpiKV02hQG9h9mcuM4Zp3XBK2tsp3SB.jpg';

  //firebase variables
  //TODO: CHECK if static works without const when user changes
  static var auth = FirebaseAuth.instance;
  static var storage = FirebaseStorage.instance;
  static var firestore = FirebaseFirestore.instance;

  //controllers
  static var authController = AuthController.instance;
  static var storageController = StorageController.instance;
  static var firestoreController = FirestoreController.instance;
  static var transactionController = TransactionController.instance;
  static var weatherController = WeatherController.instance;

  //screens list
  var screens = [
    const HomeScreen(),
    WeatherScreen(),
    const AddVehicleScreen(),
    const TransactionHistoryScreen(),
    const ProfileScreen(),
  ];

  static UserModel dummy = UserModel(
    name: 'user',
    profileImage: defaultAvatar,
    email: 'example@gmail.com',
    uid: '1234',
  );

  static List weatherPngs = ['clouds.png', 'rain.png'];
}
