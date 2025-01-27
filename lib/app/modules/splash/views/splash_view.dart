import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    controller.navigateNext();
    return Scaffold(

      body: Center(
        child:  Image.network(
          'https://i.pinimg.com/550x/39/6c/d8/396cd8e1d8557f73c786892cffa4f13c.jpg',
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
