import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/login/controllers/login.controller.dart';

class LoginTextFieldWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: controller.email,
        textAlign: TextAlign.center,
        focusNode: controller.loginFocus,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          controller.passwordFocus.requestFocus();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: controller.loginError.value,
          hintText: 'Correo Electronico',
          hintStyle: Get.textTheme.headline6?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}
