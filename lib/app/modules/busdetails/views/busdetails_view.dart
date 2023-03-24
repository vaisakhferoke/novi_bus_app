import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/busdetails_controller.dart';

class BusdetailsView extends GetView<BusdetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BusdetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BusdetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
