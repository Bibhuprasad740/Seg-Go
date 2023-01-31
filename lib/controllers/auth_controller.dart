import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidmo/views/screens/splash_screen.dart';
import '/controllers/storage_controller.dart';
import '/global_variables.dart';
import '/models/user.dart';
import '/layouts/mobile_screen_layout.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Rx<File?>? pickedImage;
  Rx<File?>? panCard;
  Rx<File?>? aadharCard;
  late Rx<User?> _user;
  Rx<bool> isLoading = false.obs;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(GlobalVariables.auth.currentUser);
    _user.bindStream(GlobalVariables.auth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => const SplashScreen());
    } else {
      Get.offAll(() => const MobileScreenLayout());
    }
  }

  //image picker
  void pickImage() async {
    isLoading.value = true;
    final localPickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (localPickedImage != null) {
      Get.snackbar('Profile Picture', 'Image selected');
    }

    pickedImage = Rx<File?>(File(localPickedImage!.path));
    isLoading.value = false;
  }

  void pickAadhar() async {
    isLoading.value = true;
    final localPickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (localPickedImage != null) {
      Get.snackbar('Aadhar Card', 'Image selected');
    }

    aadharCard = Rx<File?>(File(localPickedImage!.path));
    isLoading.value = false;
  }

  void pickPanCard() async {
    isLoading.value = true;
    final localPickedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (localPickedImage != null) {
      Get.snackbar('Pan Card', 'Image selected');
    }

    panCard = Rx<File?>(File(localPickedImage!.path));
    isLoading.value = false;
  }

  //Register user
  void registerRider(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    isLoading.value = true;
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential credential =
            await GlobalVariables.auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String? downloadUrl;

        if (image != null) {
          downloadUrl = await StorageController().uploadToStorage(image);
        }

        UserModel user = UserModel(
          name: username,
          profileImage: downloadUrl ?? GlobalVariables.defaultAvatar,
          email: email,
          uid: credential.user!.uid,
        );

        await GlobalVariables.firestore
            .collection('users')
            .doc(credential.user!.email)
            .set(user.toJson())
            .then((value) {
          Get.snackbar('Success', 'Registration Successful');
        });
        Get.snackbar('Successfuly Registered', 'User Created Successfully!');
        pickedImage = null;
      } else {
        if (image == null) {
          Get.snackbar('Error Creating user', 'Please select an image');
        } else {
          Get.snackbar('Error Creating user', 'Please fill all the fields');
        }
      }
    } on FirebaseAuthException catch (exception) {
      debugPrint('firebaseAuth exception, code = ${exception.code}');
      if (exception.code == 'email-already-in-use') {
        Get.snackbar('Can\'t Register', 'You have already registered.');
      } else if (exception.code == 'weak-password') {
        Get.snackbar(
            'Can\'t Register', 'Password should be at least 6 characters.');
      } else if (exception.code == 'invalid-email') {
        Get.snackbar('Can\'t Register', 'Please enter a valid email');
      } else if (exception.code == 'network-request-failed') {
        Get.snackbar('Can\'t Register', 'Connect to internet');
      } else if (exception.code == 'too-many-requests') {
        Get.snackbar('Can\'t Register', 'Too many requests. Try again later.');
      } else {
        Get.snackbar('Can\'t Register', exception.code.toString());
      }
    } catch (exception) {
      Get.snackbar('Error creating account', exception.toString());
      debugPrint('Catch block in AuthController.register(), $exception');
    }
    isLoading.value = false;
  }

  void registerDriver(
    String username,
    String email,
    String password,
    File? image,
    File? aadharCard,
    File? panCard,
  ) async {
    isLoading.value = true;
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        UserCredential credential =
            await GlobalVariables.auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        String? downloadUrl;

        if (image != null) {
          downloadUrl = await StorageController().uploadToStorage(image);
        }

        UserModel user = UserModel(
          name: username,
          profileImage: downloadUrl ?? GlobalVariables.defaultAvatar,
          email: email,
          uid: credential.user!.uid,
        );

        await GlobalVariables.firestore
            .collection('users')
            .doc(credential.user!.email)
            .set(user.toJson())
            .then((value) {
          Get.snackbar('Success', 'Registration Successful');
        });
        Get.snackbar('Successfuly Registered', 'User Created Successfully!');
        pickedImage = null;
      } else {
        if (image == null) {
          Get.snackbar('Error Creating user', 'Please select an image');
        } else {
          Get.snackbar('Error Creating user', 'Please fill all the fields');
        }
      }
    } on FirebaseAuthException catch (exception) {
      debugPrint('firebaseAuth exception, code = ${exception.code}');
      if (exception.code == 'email-already-in-use') {
        Get.snackbar('Can\'t Register', 'You have already registered.');
      } else if (exception.code == 'weak-password') {
        Get.snackbar(
            'Can\'t Register', 'Password should be at least 6 characters.');
      } else if (exception.code == 'invalid-email') {
        Get.snackbar('Can\'t Register', 'Please enter a valid email');
      } else if (exception.code == 'network-request-failed') {
        Get.snackbar('Can\'t Register', 'Connect to internet');
      } else if (exception.code == 'too-many-requests') {
        Get.snackbar('Can\'t Register', 'Too many requests. Try again later.');
      } else {
        Get.snackbar('Can\'t Register', exception.code.toString());
      }
    } catch (exception) {
      Get.snackbar('Error creating account', exception.toString());
      debugPrint('Catch block in AuthController.register(), $exception');
    }
    isLoading.value = false;
  }

  void login(String email, String password) async {
    isLoading.value = true;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await GlobalVariables.auth
            .signInWithEmailAndPassword(
          email: email,
          password: password,
        )
            .then((value) {
          GlobalVariables.firestoreController.addData().then((value) {
            Get.snackbar('Success', 'Login Successful');
          });
        });
      } else {
        Get.snackbar('Error', 'Please fill all the fields');
      }
    } on FirebaseAuthException catch (exception) {
      if (exception.code == 'user-not-found') {
        Get.snackbar('Login Error', 'Invalid user. Register first');
      } else if (exception.code == 'network-request-failed') {
        Get.snackbar('Login Error', 'Connect to internet');
      } else if (exception.code == 'invalid-email') {
        Get.snackbar('Login Error', 'Please enter valid email');
      } else if (exception.code == 'wrong-password') {
        Get.snackbar('Login Error', 'Incorrect password');
      } else {
        Get.snackbar('Login Error', '$exception');
      }
    } catch (exception) {
      Get.snackbar('Login Error', 'Can\'t login');
      debugPrint('Catch block in AuthController.login(), $exception');
    }
    isLoading.value = false;
  }

  Future<void> logout() async {
    isLoading.value = true;
    try {
      await GlobalVariables.auth.signOut();
    } catch (exception) {
      debugPrint('Catch block in AuthController.logout(), $exception');
    }
    isLoading.value = false;
  }
}
