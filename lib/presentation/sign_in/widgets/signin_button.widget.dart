import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/sign_in/controllers/sign_in.controller.dart';

class SignInButtonWidget extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.enableButton ? controller.signIn : null,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor),
      ),
      child: const SizedBox(
        height: 60,
        width: double.infinity,
        child: Center(
          child: Text(
            'Crear Cuenta',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
