import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  final keyForm = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController liceNoController = TextEditingController(text: '');

  final isLoading = false.obs;
}
