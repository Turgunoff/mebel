import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mebel/app/core/services/api_service.dart';
import 'package:mebel/app/core/theme/app_theme.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';
import 'package:mebel/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // GetStorage ni ishga tushirish
  await ApiService.usdKursiniYangilash();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _box = GetStorage();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Debug bannerini o'chirish
      title: "Mebel Do'koni",
      theme: AppTheme.lightTheme, // Boshlang'ich tema
      darkTheme: AppTheme.darkTheme,
      themeMode: _box.read('isDarkMode') == null
          ? ThemeMode
              .system // Agar oldin tanlangan tema bo'lmasa, tizim temasidan foydalanish
          : _box.read('isDarkMode')
              ? ThemeMode.dark
              : ThemeMode
                  .light, // Aks holda, saqlangan tema rejimidan foydalanish, // GetX qurilma temasiga moslashadi
      home: BottomNavigationBarWidget(),
      getPages: AppPages.routes,
      initialBinding: BottomNavigationBinding(),
      // initialRoute: AppPages.,
    );
  }
}
