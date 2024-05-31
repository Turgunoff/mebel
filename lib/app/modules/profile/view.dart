import 'package:flutter/material.dart';
import 'package:mebel/app/core/widgets/bottom_navigation_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: const Center(
        child: Text('Profile'),
      ),
      // bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}
