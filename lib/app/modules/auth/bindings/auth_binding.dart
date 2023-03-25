import 'package:get/get.dart';
import 'package:novi_bus_app/api/api_provider.dart';

import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(),
    );
    Get.lazyPut<ApiProvider>(
      () => ApiProvider(),
    );
  }
}
