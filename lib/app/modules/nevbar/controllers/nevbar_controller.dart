import 'package:get/get.dart';

class NevbarController extends GetxController {
  int selectedIndex = 0;

  int get currentIndex => selectedIndex;

  final count = 0.obs;

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
}
