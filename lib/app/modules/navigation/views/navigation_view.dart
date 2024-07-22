import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nusantara_delight/app/modules/navigation/controllers/navigation_controller.dart';

class NavigationView extends StatelessWidget {
  final NavigationController navigationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => IndexedStack(
          index: navigationController.currentIndex.value,
          children: navigationController.pages,
        )),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: navigationController.currentIndex.value,
        onTap: (index) => navigationController.changePage(index),
        items: [
          _buildBottomNavigationBarItem(icon: Icons.home, label: "Home"),
          _buildBottomNavigationBarItem(icon: Icons.restaurant_menu, label: "Menu"),
          _buildBottomNavigationBarItem(icon: Icons.person, label: "Profile"),
        ],
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
      )),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
