import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:novi_bus_app/app/modules/home/views/widget/home_card.dart';
import 'package:novi_bus_app/app/modules/home/views/widget/home_sreen_list_tile.dart';
import 'package:novi_bus_app/app/routes/app_pages.dart';
import 'package:novi_bus_app/utils/icons.dart';
import 'package:novi_bus_app/utils/settings.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(
          svgIcons.logo,
          height: 40,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: HomeScreenCard(
                    imageName: images.bus,
                    title1: 'Bus',
                    title2: "Manage your Bus",
                    color: AppUiSettings().primaryColor,
                    right: -10,
                    bottom: 0,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.DRIVER);
                  },
                  child: HomeScreenCard(
                    imageName: images.driver,
                    title1: 'Driver',
                    title2: "Manage your Driver",
                    color: AppUiSettings().colorGray1,
                    right: 15,
                    bottom: 0,
                  ),
                ),
              ],
            ),
            // bottom
            const SizedBox(
              height: 20,
            ),
            const Text(
              '21 Buses Found',
              style: TextStyle(
                fontSize: 13,
                color: Color.fromRGBO(107, 107, 107, 1),
              ),
            ),
            Flexible(
              child: SizedBox(
                child: ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 10,
                        ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.buslist.length,
                    itemBuilder: (_, index) {
                      return HomeScreenBusListTile(
                        seatType: controller.buslist[index],
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
