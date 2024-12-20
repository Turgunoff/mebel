import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:mebel/app/modules/cart/controller.dart';
import 'package:mebel/app/modules/cart/view.dart';
import 'package:mebel/app/modules/categories/controller.dart';
import 'package:mebel/app/modules/categories/view.dart';
import 'package:mebel/app/modules/favorites/controller.dart';
import 'package:mebel/app/modules/favorites/view.dart';
import 'package:mebel/app/modules/home/controller.dart';
import 'package:mebel/app/modules/home/view.dart';
import 'package:mebel/app/modules/profile/controller.dart';
import 'package:mebel/app/modules/profile/view.dart';

import 'package:badges/badges.dart' as badges; // badges paketini import qiling

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({super.key});
  final controller = Get.put(NavigationController());

  final homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80.0,
          elevation: 0,
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: (index) =>
              controller.currentIndex.value = index,
          backgroundColor: Theme.of(context).colorScheme.background,
          indicatorColor: Theme.of(context).primaryColor,
          animationDuration: const Duration(milliseconds: 300),
          destinations: [
            const NavigationDestination(
              selectedIcon: Icon(Iconsax.home_copy, color: Colors.white),
              icon: Icon(Iconsax.home_copy),
              label: 'Главная',
            ),
            NavigationDestination(
              selectedIcon: Obx(
                () => badges.Badge(
                  badgeContent: Text(
                    homeController.favorites.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  showBadge: homeController.favorites.isNotEmpty,
                  position: badges.BadgePosition.topEnd(top: -8, end: -8),
                  child: const Icon(Iconsax.heart_copy, color: Colors.white),
                ),
              ),
              icon: Obx(
                () => badges.Badge(
                  badgeContent: Text(
                    homeController.favorites.length.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  showBadge: homeController.favorites.isNotEmpty,
                  position: badges.BadgePosition.topEnd(top: -8, end: -8),
                  child: const Icon(Iconsax.heart_copy),
                ),
              ),
              // selectedIcon: Icon(Iconsax.heart_copy, color: Colors.white),
              // icon: Icon(Iconsax.heart_copy),
              label: 'Избранное',
            ),
            const NavigationDestination(
              selectedIcon: Icon(Iconsax.category_copy, color: Colors.white),
              icon: Icon(Iconsax.category_copy),
              label: 'Каталог',
            ),
            const NavigationDestination(
              selectedIcon:
                  Icon(Iconsax.shopping_cart_copy, color: Colors.white),
              icon: Icon(Iconsax.shopping_cart_copy),
              label: 'Корзина',
            ),
            const NavigationDestination(
              selectedIcon:
                  Icon(Iconsax.profile_circle_copy, color: Colors.white),
              icon: Icon(Iconsax.profile_circle_copy),
              label: 'Профиль',
            ),
          ],
        ),
      ),
      body: Obx(
        () => controller.screens[controller.currentIndex.value],
      ),
    );
  }
}

class NavigationController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final screens = [
    HomeScreen(),
    FavoritesView(),
    const CategoriesView(),
    const CartView(),
    ProfileView(),
  ];
}

class BottomNavigationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => FavoritesController());
    Get.lazyPut(() => CategoriesController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => ProfileController());
  }
}
