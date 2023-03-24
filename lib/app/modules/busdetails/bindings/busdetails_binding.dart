import 'package:get/get.dart';

import '../controllers/busdetails_controller.dart';

class BusdetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusdetailsController>(
      () => BusdetailsController(),
    );
  }
}
