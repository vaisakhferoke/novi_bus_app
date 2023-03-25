import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusHeadScreenCard extends StatelessWidget {
  final String imageName, title1, title2;
  final Color color;
  final double right, bottom;
  const BusHeadScreenCard({
    Key? key,
    required this.imageName,
    required this.title1,
    required this.title2,
    required this.color,
    required this.right,
    required this.bottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height * .15,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
        ),
        Positioned(
          top: 5,
          left: 8,
          child: Text(
            title1,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Positioned(
          top: 40,
          left: 8,
          child: Text(
            title2,
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
        Positioned(
          bottom: bottom,
          right: right,
          child: SizedBox(
            height: Get.height * .15,
            child: Image.asset(
              imageName,
            ),
          ),
        ),
      ],
    );
  }
}
