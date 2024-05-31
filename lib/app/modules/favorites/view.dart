import 'package:flutter/material.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: const Center(
        child: Text('Favorites'),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
