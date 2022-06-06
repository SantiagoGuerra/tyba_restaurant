import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/login/controllers/login.controller.dart';

class PasswordTextFieldWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: controller.password,
        textAlign: TextAlign.center,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => controller.doLogin(),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: controller.passwordError.value,
          hintText: 'Contraseña',
          hintStyle: Get.textTheme.headline6?.copyWith(color: Colors.black54),
        ),
      ),
    );
  }
}
