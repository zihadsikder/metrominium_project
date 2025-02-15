import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/more_controller.dart';

class MoreView extends GetView<MoreController> {
  const MoreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoreView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MoreView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
