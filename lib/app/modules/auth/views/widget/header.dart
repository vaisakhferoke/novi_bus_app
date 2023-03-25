import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/utils/icons.dart';
import 'package:novi_bus_app/utils/settings.dart';

class LoginHeaderBanner extends StatelessWidget {
  const LoginHeaderBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .40,
      width: Get.height * 1,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            images.loginImage,
            fit: BoxFit.fill,
          ),
          Positioned(
              left: Get.height * .05,
              top: Get.height * .18,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome',
                    style: TextStyle(
                        color: AppUiSettings().scaffoldbgColor,
                        fontFamily: 'axiforma',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                  Text(
                    'Manage your Bus and Drivers',
                    style: TextStyle(
                      color: AppUiSettings().scaffoldbgColor,
                      fontFamily: 'axiforma',
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
