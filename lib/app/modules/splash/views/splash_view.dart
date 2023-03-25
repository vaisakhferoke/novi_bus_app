import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/app/routes/app_pages.dart';
import 'package:novi_bus_app/utils/icons.dart';
import 'package:novi_bus_app/utils/settings.dart';
import 'package:novi_bus_app/widgets/button/common_button.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUiSettings().primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(),
            Center(
              child: SvgPicture.asset(svgIcons.logo),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: CommonButton(
                lable: "Get Started",
                buttonColor: Colors.white,
                labelColor: AppUiSettings().primaryColor,
                fun: () {
                  Get.toNamed(Routes.AUTH);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
