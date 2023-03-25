import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/app/modules/busdetails/views/widget/bus_det_head_card.dart';
import 'package:novi_bus_app/utils/icons.dart';
import 'package:novi_bus_app/utils/settings.dart';
import '../controllers/busdetails_controller.dart';

class BusdetailsSeat3View extends GetView<BusdetailsController> {
  const BusdetailsSeat3View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BusdetailsView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            BusHeadScreenCard(
              imageName: images.driver,
              title1: 'Rohit sharma',
              title2: "License no: PJ515196161655",
              color: AppUiSettings().colorGray1,
              right: 15,
              bottom: 0,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black.withOpacity(.1)),
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GetBuilder<BusdetailsController>(builder: (context) {
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 30, right: 20),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SvgPicture.asset(
                            svgIcons.seat,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      for (int i = 0; i < 5; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            margin: EdgeInsets.only(top: i == 0 ? 10 : 0),
                            child: Row(
                              children: <Widget>[
                                for (int x = 1; x < 6; x++)
                                  Expanded(
                                    child: (x == 2)
                                        ? Container()
                                        : Container(
                                            height: 60,
                                            margin: const EdgeInsets.all(5),
                                            child: controller.chair3List[i]
                                                        [x - 1] ==
                                                    1
                                                ? availableChair(i, x - 1)
                                                : controller.chair3List[i]
                                                            [x - 1] ==
                                                        2
                                                    ? chair(i, x - 1)
                                                    : reservedChair(),
                                          ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget chair(int a, int b) {
    return InkWell(
      onTap: () {
        controller.chair3List[a][b] = 1;
        controller.update();
      },
      child: Center(
        child: SvgPicture.asset(
          svgIcons.seat,
          color: AppUiSettings().primaryColor,
        ),
      ),
    );
  }

  Widget availableChair(int a, int b) {
    return InkWell(
      onTap: () {
        controller.chair3List[a][b] = 2;
        controller.update();
      },
      child: Center(
          child: SvgPicture.asset(
        svgIcons.seat,
        color: Colors.green,
      )),
    );
  }

  Widget reservedChair() {
    return Center(child: SvgPicture.asset(svgIcons.seat, color: Colors.grey));
  }
}
