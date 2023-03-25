import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:novi_bus_app/app/modules/auth/views/widget/header.dart';
import 'package:novi_bus_app/app/routes/app_pages.dart';
import 'package:novi_bus_app/utils/settings.dart';
import 'package:novi_bus_app/widgets/button/common_button.dart';
import 'package:novi_bus_app/widgets/textfield/com_textfield.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppUiSettings().scaffoldbgColor,
        body: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoginHeaderBanner(),
              Expanded(
                flex: 8,
                child: Form(
                    key: controller.keyForm,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CustomTextFormField(
                            hintText: 'Enter Username',
                            controller: controller.usernameController,
                            onChanged: (value) {
                              controller.keyForm.currentState!.validate();
                            },
                            validator: (value) {
                              if (!controller.isLoading.value) {
                                return null;
                              }
                              if (value?.trim().isEmpty ?? true) {
                                return "User Name is required.";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hintText: 'Enter Password',
                            controller: controller.passwordController,
                            onChanged: (value) {
                              controller.keyForm.currentState!.validate();
                            },
                            validator: (value) {
                              if (!controller.isLoading.value) {
                                return null;
                              }
                              if (value?.trim().isEmpty ?? true) {
                                return "Password is required.";
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    )),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Obx(() => CommonButton(
                      lable: "Login",
                      isLoading: controller.isLoading.value,
                      fun: () {
                        if (controller.keyForm.currentState!.validate()) {
                          controller.login();
                        }
                      })),
                ),
              ),
            ],
          ),
        )));
  }
}
