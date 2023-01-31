import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';

import '../models/user.dart';

class FirestoreController extends GetxController {
  static FirestoreController instance = Get.find();

  Rx<UserModel?> userModel = GlobalVariables.dummy.obs;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    addData();
  }

  Future<void> addData() async {
    isLoading.value = true;
    try {
      DocumentSnapshot snapshot = await GlobalVariables.firestore
          .collection('users')
          .doc(GlobalVariables.auth.currentUser!.email!)
          .get();
      userModel.value = UserModel.fromSnap(snapshot);
      // print(userModel.value!.name);
    } catch (exception) {
      debugPrint('Catch block in FirestoreController.addData(), $exception');
    }
    isLoading.value = false;
  }
}
