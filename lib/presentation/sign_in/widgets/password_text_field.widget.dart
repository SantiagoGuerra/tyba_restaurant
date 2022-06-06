import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/sign_in/controllers/sign_in.controller.dart';

class PasswordTextFieldWidget extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: controller.password,
        textAlign: TextAlign.center,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => controller.signIn(),
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
