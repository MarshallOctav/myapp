import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void loginNow() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email dan Password wajib diisi",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Simulasi login berhasil
    Get.snackbar("Success", "Login berhasil!",
        backgroundColor: Colors.green, colorText: Colors.white);
  }
}
