import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final _box = GetStorage();
  final isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value =
        _box.read('isDarkMode') ?? false; // Saqlangan qiymatni o'qiymiz
  }

  void changeThemeMode() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = !isDarkMode.value; // Qiymatni teskarisiga o'zgartiramiz
    _box.write('isDarkMode', isDarkMode.value); // Yangi qiymatni saqlaymiz
  }
  // ... boshqa ProfileController logikasi
}
