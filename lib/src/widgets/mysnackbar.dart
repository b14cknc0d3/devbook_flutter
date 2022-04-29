import 'package:flutter/material.dart';
import 'package:get/get.dart';

////
///
///
///
///
mySnackBar(String text, bool error) {
  return Get.snackbar(
    error ? "Error" : "Info",
    text,
    backgroundColor: error ? Colors.red : Colors.green,
  );
}
