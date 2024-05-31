import 'package:flutter/material.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Home'),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(
      //   currentIndex: 0,
      // ),
    );
  }
}
