import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/utils/icons.dart';
import 'package:novi_bus_app/utils/settings.dart';

class HomeScreenBusListTile extends StatelessWidget {
  const HomeScreenBusListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black.withOpacity(.1)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: Get.width * .20,
            height: 70,
            color: const Color(0xffF3F3F3),
            child: Center(
              child: Image.asset(
                images.bus2,
                fit: BoxFit.fill,
              ),
            ),
          ), // Text(
          //   'Swift Scania P-series',
          //   style: TextStyle(
          //       fontFamily: 'auxiforma',
          //       fontSize: SizeConfig.blockSizeHorizontal! * 4),
          // ),
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 10),
            child: SizedBox(
              width: Get.width * .4,
              child: const Text(
                "KSRTC Swift Scania P-​series",
                textAlign: TextAlign.start,
                style: TextStyle(fontFamily: 'auxiforma', fontSize: 14),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 30,
              width: 70,
              decoration: BoxDecoration(
                color: AppUiSettings().primaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Center(
                child: Text(
                  'Manage',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'auxiforma',
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
