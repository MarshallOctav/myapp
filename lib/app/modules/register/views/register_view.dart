import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart'; // Pastikan ini sudah ditambahkan di pubspec.yaml
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    RegisterController controller = Get.put(RegisterController());
    return Scaffold(
      backgroundColor: Colors.grey[200], // Gunakan warna yang lebih netral
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0),
                child: Lottie.network(
                  'https://gist.githubusercontent.com/olipiskandar/2095343e6b34255dcfb042166c4a3283/raw/d76e1121a2124640481edcf6e7712130304d6236/praujikom_kucing.json',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: controller.nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                  hintText: 'Masukan Nama',
                  prefixIcon: Icon(Icons.person), // Tambahkan ikon
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  hintText: 'Masukan Email',
                  prefixIcon: Icon(Icons.email), // Tambahkan ikon
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Masukan Password',
                  prefixIcon: Icon(Icons.lock), // Tambahkan ikon
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: controller.passwordConfirmationController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password Confirmation',
                  hintText: 'Masukan Ulang Password',
                  prefixIcon: Icon(Icons.lock_outline), // Tambahkan ikon
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextButton(
                  onPressed: () {
                    if (controller.nameController.text.isEmpty ||
                        controller.emailController.text.isEmpty ||
                        controller.passwordController.text.isEmpty ||
                        controller.passwordConfirmationController.text.isEmpty) {
                      Get.snackbar(
                        "Error",
                        "Semua field harus diisi!",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }
                    if (controller.passwordController.text !=
                        controller.passwordConfirmationController.text) {
                      Get.snackbar(
                        "Error",
                        "Password dan Konfirmasi Password tidak cocok!",
                        snackPosition: SnackPosition.BOTTOM,
                      );
                      return;
                    }
                    controller.registerNow();
                  },
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
