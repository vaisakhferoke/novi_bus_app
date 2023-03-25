import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:novi_bus_app/app/modules/driver/views/widget/driver_card.dart';
import 'package:novi_bus_app/app/routes/app_pages.dart';
import 'package:novi_bus_app/widgets/button/common_button.dart';

import '../controllers/driver_controller.dart';

class DriverView extends GetView<DriverController> {
  const DriverView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver List'),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CommonButton(
            lable: "Add Driver",
            fun: () {
              Get.toNamed(Routes.DRIVER_ADD);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(
                  '${controller.driverList.length} Drivers Found',
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color.fromRGBO(107, 107, 107, 1),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: SizedBox(
                child: Obx(() => controller.isLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : controller.driverList.isEmpty
                        ? const Center(
                            child: Text("No Data"),
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                ),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: controller.driverList.length,
                            itemBuilder: (_, index) {
                              return InkWell(
                                  onTap: () {},
                                  child: DriverListTile(
                                    liceNo:
                                        controller.driverList[index].licenseNo,
                                    name: controller.driverList[index].name,
                                    act: () {
                                      controller.deleteDriver(controller
                                          .driverList[index].id
                                          .toString());
                                    },
                                  ));
                            })),
              ),
            )
          ],
        ),
      ),
    );
  }
}
