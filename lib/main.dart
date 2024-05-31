import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';
import 'package:mebel/firebase_options.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // Debug bannerini o'chirish
      title: "Mebel Do'koni",
      home: BottomNavigationBarWidget(),
      // initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
