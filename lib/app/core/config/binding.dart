import 'package:get/get.dart';
import 'package:metrominium_project/app/modules/more/controllers/more_controller.dart';
import 'package:metrominium_project/app/modules/request/controllers/request_controller.dart';
import 'package:metrominium_project/app/modules/services/controllers/services_controller.dart';

import '../../modules/home/controllers/home_controller.dart';

class IntBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ServicesController>(() => ServicesController());
    Get.lazyPut<MoreController>(() => MoreController());
    Get.lazyPut<RequestController>(() => RequestController());
  }
  }