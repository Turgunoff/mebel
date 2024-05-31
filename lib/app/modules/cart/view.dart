import 'package:flutter/material.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: const Center(
        child: Text('Cart'),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
