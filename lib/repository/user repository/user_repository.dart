import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hiw/presentation/userinfo.dart';

class UserRipository extends GetxController {
  static UserRipository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  crateUser(UserModel user)async {
   await _db
        .collection("users")
        .add(user.toJson())
        .whenComplete(() => Get.snackbar(
            "success", "your account has been created. ",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green))
        .catchError((error, stackTree) {
      Get.snackbar("Error", "Something went wrong. Try again",
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}
