import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/busdetails_controller.dart';

class BusdetailsView extends GetView<BusdetailsController> {
  const BusdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusdetailsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BusdetailsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
