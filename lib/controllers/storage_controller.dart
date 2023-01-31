import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidmo/global_variables.dart';

class StorageController extends GetxController {
  static StorageController instance = Get.find();

  //upload profile picture
  Future<String> uploadToStorage(File image) async {
    String downloadUrl = 'Something went wrong';
    try {
      Reference ref = await GlobalVariables.storage
          .ref()
          .child('profilePics')
          .child(GlobalVariables.auth.currentUser!.email!);
      TaskSnapshot snapshot = await ref.putFile(image);
      downloadUrl = await snapshot.ref.getDownloadURL();
    } catch (exception) {
      Get.snackbar('Upload failed', exception.toString());
      debugPrint(
          'catch block in StorageController.uploadToStorage(), $exception');
    }
    return downloadUrl;
  }
}
