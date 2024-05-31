import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mebel/app/modules/home/controller.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mebel uz'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.notification_copy),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50.0,
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  fillColor: Color(0xFFF3F2F7),
                  prefixIcon: Icon(
                    Iconsax.search_normal,
                    color: Colors.grey,
                    size: 25,
                  ),
                  hintText: 'Поиск товаров',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Obx(() => TextButton(
                onPressed: () {
                  Get.toNamed('/profile');
                },
                child: Text(
                  controller.count.value.toString(),
                )))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Iconsax.add),
      ),
    );
  }
}
