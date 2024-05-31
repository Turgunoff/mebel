import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebel/app/modules/profile/controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({super.key});

  // final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: Center(
        child: SwitchListTile(
          title: const Text('Dark Mode'),
          value: controller.isDarkMode.value, // O'zgaruvchiga murojaat qilish
          onChanged: (val) {
            controller.changeThemeMode();
          },
        ),
      ),
    );
  }
}
