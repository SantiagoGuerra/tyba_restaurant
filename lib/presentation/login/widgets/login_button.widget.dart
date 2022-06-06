import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/login/controllers/login.controller.dart';

class LoginButtonWidget extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: controller.doLogin,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Get.theme.primaryColor),
      ),
      child: const SizedBox(
        width: double.infinity,
        height: 52,
        child: Center(
          child: Text(
            'Entrar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
