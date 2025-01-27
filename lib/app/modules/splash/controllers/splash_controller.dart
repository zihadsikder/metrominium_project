import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  void navigateNext() async {
    await Future.delayed(const Duration(seconds: 2));

      Get.offNamed(Routes.NEVBAR);

  }
}
