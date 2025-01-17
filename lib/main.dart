import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart'; // Tambahan import untuk mendukung gesture

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Pastikan Flutter binding telah diinisialisasi
  await GetStorage.init(); // Inisialisasi GetStorage
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Event", // Ubah title menjadi "My Event"
      initialRoute: AppPages.INITIAL, // Rute awal aplikasi
      getPages: AppPages.routes, // Daftar rute aplikasi
      scrollBehavior: MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown, // Mendukung perangkat input tambahan
        },
      ),
    ),
  );
}
