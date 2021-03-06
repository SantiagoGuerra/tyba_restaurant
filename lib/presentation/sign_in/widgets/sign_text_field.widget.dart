import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/login/controllers/login.controller.dart';
import 'package:tyba_restaurant/presentation/sign_in/controllers/sign_in.controller.dart';

class SignInTextFieldWidget extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        onChanged: controller.email,
        focusNode: controller.loginFocus,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) {
          controller.passwordFocus.requestFocus();
        },
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          errorText: controller.loginError.value,
          hintText: 'Correo Electronico',
        ),
      ),
    );
  }
}
