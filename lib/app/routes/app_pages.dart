import 'package:get/get.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';
import 'package:mebel/app/modules/cart/bindings.dart';
import 'package:mebel/app/modules/cart/view.dart';
import 'package:mebel/app/modules/categories/bindings.dart';
import 'package:mebel/app/modules/categories/view.dart';
import 'package:mebel/app/modules/favorites/bindings.dart';
import 'package:mebel/app/modules/favorites/view.dart';
import 'package:mebel/app/modules/home/bindings.dart';
import 'package:mebel/app/modules/home/view.dart';
import 'package:mebel/app/modules/profile/bindings.dart';
import 'package:mebel/app/modules/profile/view.dart';

part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.BottomNavigation;

  static final routes = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.CATEGORIES,
      page: () => const CategoriesView(),
      binding: CategoriesBinding(),
    ),
    GetPage(
      name: AppRoutes.FAVORITES,
      page: () => const FavoritesView(),
      binding: FavoritesBinding(),
    ),
    GetPage(
      name: AppRoutes.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.BottomNavigation,
      page: () => BottomNavigationBarWidget(),
      binding: BottomNavigationBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.HOME)
    // GetPage(
    //   name: AppRoutes.PRODUCT_DETAILS,
    //   page: () => const ProductDetailsView(),
    //   binding: ProductDetailsBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.LOGIN,
    //   page: () => const LoginView(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.SIGNUP,
    //   page: () => const SignupView(),
    //   binding: SignupBinding(),
    // ),
  ];
}
