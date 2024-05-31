import 'package:flutter/material.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: const Center(
        child: Text('Categories'),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(
      //   currentIndex: 1,
      // ),
    );
  }
}
