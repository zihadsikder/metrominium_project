import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NevbarController extends GetxController {
  int selectedIndex = 0;

  int get currentIndex => selectedIndex;

  @override
  void onInit() {
    super.onInit();
  }
  void changeIndex(int index) {
    if (selectedIndex == index) {
      return;
    }
    selectedIndex = index;
    update();
  }
  void backToHome() {
    changeIndex(0);
  }
  final List<GridItem> gridItems = [
    GridItem(icon: Icons.account_circle, title: "Profile"),
    GridItem(icon: Icons.settings, title: "Settings"),
    GridItem(icon: Icons.notifications, title: "Notifications"),
    GridItem(icon: Icons.help, title: "Help"),
    GridItem(icon: Icons.language, title: "Language"),
    GridItem(icon: Icons.contact_support, title: "Support"),
    GridItem(icon: Icons.logout, title: "Logout"),
    GridItem(icon: Icons.favorite, title: "Favorites"),
    GridItem(icon: Icons.security, title: "Security"),
    GridItem(icon: Icons.feedback, title: "Feedback"),
    GridItem(icon: Icons.update, title: "Updates"),
    GridItem(icon: Icons.info, title: "About"),
    GridItem(icon: Icons.mobile_friendly, title: "Mobile"),
  ];
}

class GridItem {
  final IconData icon;
  final String title;
  GridItem({required this.icon, required this.title});
}