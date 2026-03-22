import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils{


 static showSuccessMessage(String title) {
    Get.showSnackbar(GetSnackBar(
      snackStyle: SnackStyle.GROUNDED,
      title: "Success",
      message: title,
      backgroundColor: Colors.green,
      duration: const Duration(milliseconds: 2500),
    ));
  }

 static showError(String title) {
    Get.showSnackbar(GetSnackBar(
      snackStyle: SnackStyle.GROUNDED,
      title: "Error",
      message: title,
      duration: const Duration(milliseconds: 2500),
    ));
  }
}
