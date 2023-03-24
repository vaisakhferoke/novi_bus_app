import 'package:get/get.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/busdetails/bindings/busdetails_binding.dart';
import '../modules/busdetails/views/busdetails_view.dart';
import '../modules/driver/bindings/driver_binding.dart';
import '../modules/driver/views/driver_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.DRIVER,
      page: () => DriverView(),
      binding: DriverBinding(),
    ),
    GetPage(
      name: _Paths.BUSDETAILS,
      page: () => BusdetailsView(),
      binding: BusdetailsBinding(),
    ),
  ];
}
