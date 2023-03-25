import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenCard extends StatelessWidget {
  final String imageName, title1, title2;
  final Color color;
  final double right, bottom;
  const HomeScreenCard({
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
          width: Get.width * .44,
          height: Get.height * .21,
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
          top: 30,
          left: 8,
          child: Text(
            title2,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
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
