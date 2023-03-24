import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/driver_controller.dart';

class DriverView extends GetView<DriverController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DriverView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DriverView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
