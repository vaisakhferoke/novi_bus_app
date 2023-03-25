import 'package:get/get.dart';
import 'package:novi_bus_app/api/api_provider.dart';

import '../controllers/driver_controller.dart';

class DriverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DriverController>(
      () => DriverController(),
    );
    Get.lazyPut<ApiProvider>(
      () => ApiProvider(),
    );
  }
}
