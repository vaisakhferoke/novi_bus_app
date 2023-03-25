import 'package:flutter/material.dart';
import 'package:novi_bus_app/utils/settings.dart';

class CommonButton extends StatelessWidget {
  final String lable;
  final VoidCallback fun;
  final bool? isLoading;
  final Color? labelColor, buttonColor;
  const CommonButton({
    Key? key,
    required this.lable,
    required this.fun,
    this.isLoading,
    this.labelColor,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        fun();
      },
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .06,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: buttonColor ?? AppUiSettings().primaryColor),
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    lable,
                    style: TextStyle(
                      color: labelColor ?? Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
