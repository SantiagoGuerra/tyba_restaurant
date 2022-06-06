import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/sign_in/controllers/sign_in.controller.dart';

class PasswordTextFieldWidget extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: controller.password,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) => controller.signIn(),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: controller.passwordError.value,
          hintText: 'Contraseña',
        ),
      ),
    );
  }
}
