import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  TextEditingController usernameController =
      TextEditingController(text: 'admin_user');
  TextEditingController passwordController =
      TextEditingController(text: '123admin789');

  final isLoading = false.obs;
}
