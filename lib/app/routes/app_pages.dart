import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/more/bindings/more_binding.dart';
import '../modules/more/views/more_view.dart';
import '../modules/nevbar/bindings/nevbar_binding.dart';
import '../modules/nevbar/views/nevbar_view.dart';
import '../modules/request/bindings/request_binding.dart';
import '../modules/request/views/request_view.dart';
import '../modules/services/bindings/services_binding.dart';
import '../modules/services/views/services_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.SERVICES,
      page: () =>ServicesView(),
      binding: ServicesBinding(),
    ),
    GetPage(
      name: _Paths.MORE,
      page: () => const MoreView(),
      binding: MoreBinding(),
    ),
    GetPage(
      name: _Paths.REQUEST,
      page: () => const RequestView(),
      binding: RequestBinding(),
    ),
    GetPage(
      name: _Paths.NEVBAR,
      page: () =>  NevbarView(),
      binding: NevbarBinding(),
    ),
  ];
}
