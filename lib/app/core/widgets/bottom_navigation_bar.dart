import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mebel/app/modules/cart/view.dart';
import 'package:mebel/app/modules/categories/view.dart';
import 'package:mebel/app/modules/favorites/view.dart';
import 'package:mebel/app/modules/home/view.dart';
import 'package:mebel/app/modules/profile/view.dart';
import 'package:mebel/app/routes/app_pages.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({super.key});
  final controller = Get.put(NavigationController());

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
          backgroundColor: const Color(0xFFF9F9F9),
          indicatorColor: Colors.red,
          animationDuration: const Duration(milliseconds: 300),
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Iconsax.home, color: Colors.white),
              icon: Icon(Iconsax.home),
              label: 'Главная',
            ),
            NavigationDestination(
              // selectedIcon: Obx(
              //   () => badges.Badge(
              //     badgeContent: Text(
              //       favoritesController.favorites.length.toString(),
              //       style: const TextStyle(color: Colors.white),
              //     ),
              //     showBadge: favoritesController.favorites.isNotEmpty,
              //     position: badges.BadgePosition.topEnd(top: -8, end: -8),
              //     child: const Icon(Iconsax.heart,
              //         color: Colors
              //             .white), // Tanlangan ikonka uchun rangni o'zgartiring
              //   ),
              // ),
              // icon: Obx(
              //   () => badges.Badge(
              //     badgeContent: Text(
              //       favoritesController.favorites.length.toString(),
              //       style: const TextStyle(color: Colors.white),
              //     ),
              //     showBadge: favoritesController.favorites.isNotEmpty,
              //     position: badges.BadgePosition.topEnd(top: -8, end: -8),
              //     child: const Icon(Iconsax
              //         .heart), // Tanlanmagan ikonka uchun rangni o'zgartiring
              //   ),
              // ),
              selectedIcon: Icon(Iconsax.heart, color: Colors.white),
              icon: Icon(Iconsax.heart),
              label: 'Избранное',
            ),
            NavigationDestination(
              selectedIcon: Icon(Iconsax.category, color: Colors.white),
              icon: Icon(Iconsax.category),
              label: 'Каталог',
            ),
            NavigationDestination(
              selectedIcon: Icon(Iconsax.shopping_cart, color: Colors.white),
              icon: Icon(Iconsax.shopping_cart),
              label: 'Корзина',
            ),
            NavigationDestination(
              selectedIcon: Icon(Iconsax.profile_circle, color: Colors.white),
              icon: Icon(Iconsax.profile_circle),
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
    const HomeScreen(),
    const FavoritesView(),
    const CategoriesView(),
    const CartView(),
    const ProfileView(),
  ];
}
