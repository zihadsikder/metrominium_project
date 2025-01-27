import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController  with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var totalEarnings = 5101.1.obs;
  var totalSubscribers = 56.obs;
  var totalServices = 356.obs;
  var totalBookings = 371.obs;
  var selectedPeriod = 'monthly'.obs;
  var tabIndex = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }
  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  final List<Tab> tab = [
    const Tab(text: 'Normal Bookings'),
    const Tab(text: 'Customized Bookings'),
  ];

  void changePeriod(String period) {
    selectedPeriod.value = period;
    // Here you would typically fetch new data based on the period
  }

}
