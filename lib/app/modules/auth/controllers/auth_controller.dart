import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/api/api_provider.dart';
import 'package:novi_bus_app/app/routes/app_pages.dart';
import 'package:novi_bus_app/config/session.dart';
import 'package:novi_bus_app/utils/style.dart';

class AuthController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  TextEditingController usernameController =
      TextEditingController(text: 'admin_user');
  TextEditingController passwordController =
      TextEditingController(text: '123admin789');

  final isLoading = false.obs;
  final ApiProvider _provider = GetInstance().find<ApiProvider>();

  void login() async {
    isLoading(true);

    final response = await _provider.loginApi(
        usernameController.text.trim(), passwordController.text);

    if (response != null) {
      if (response.status) {
        Session.name = response.name!;
        Session.accessId = response.access!;
        Session.urlId = response.urlId!;
        Get.offAndToNamed(Routes.HOME);
      } else {
        errorToast(response.message!);
      }
    }
    isLoading(false);
  }
}
