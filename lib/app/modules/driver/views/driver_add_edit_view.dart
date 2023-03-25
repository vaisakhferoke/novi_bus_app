import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/widgets/button/common_button.dart';
import 'package:novi_bus_app/widgets/textfield/com_textfield.dart';
import '../controllers/driver_controller.dart';

class DriverAddView extends GetView<DriverController> {
  const DriverAddView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: controller.keyForm,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Enter Name',
                controller: controller.nameController,
                onChanged: (value) {
                  controller.keyForm.currentState!.validate();
                },
                validator: (value) {
                  if (!controller.isLoading.value) {
                    return null;
                  }
                  if (value?.trim().isEmpty ?? true) {
                    return "Name is required.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomTextFormField(
                hintText: 'Enter License Numeber',
                controller: controller.liceNoController,
                onChanged: (value) {
                  controller.keyForm.currentState!.validate();
                },
                validator: (value) {
                  if (!controller.isLoading.value) {
                    return null;
                  }
                  if (value?.trim().isEmpty ?? true) {
                    return "License Number is required.";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: CommonButton(
            lable: "Save",
            fun: () {
              if (controller.keyForm.currentState!.validate()) {
                controller.add();
              }
            }),
      ),
    );
  }
}
