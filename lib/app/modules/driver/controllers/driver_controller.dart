import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/api/api_provider.dart';
import 'package:novi_bus_app/model/driver_list_model.dart';

class DriverController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController liceNoController = TextEditingController(text: '');

  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    allDrivers();
  }

  RxList<DriverList> driverList = <DriverList>[].obs;
  final ApiProvider _provider = GetInstance().find<ApiProvider>();

  void allDrivers() async {
    isLoading(true);

    final response = await _provider.allDrivers();
    driverList.clear();
    if (response != null) {
      if (response.status) {
        driverList.addAll(response.driverList);
      } else {}
    }
    isLoading(false);
  }

  void add() async {
    isLoading(true);

    final response =
        await _provider.addDrivers(nameController.text, liceNoController.text);

    if (response != null) {
      if (response.status) {
        Get.back();
        allDrivers();
      } else {}
    }
    isLoading(false);
  }
}
