import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'appearance.dart';

bool validEmail(email) => RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
    .hasMatch(email);

void showErrorSnack(String title, String msg) {
  Get.snackbar(title, msg,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
      backgroundColor: MyColors.primaryAccent);
}

void showSuccessSnack(String title, String msg) {
  Get.snackbar(title, msg,
      colorText: Colors.white,
      duration: const Duration(seconds: 5),
      backgroundColor: MyColors.successColor);
}
