import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/infrastructure/navigation/routes.dart';
import 'package:tyba_restaurant/presentation/login/widgets/login_button.widget.dart';
import 'package:tyba_restaurant/presentation/login/widgets/login_text_field.widget.dart';
import 'package:tyba_restaurant/presentation/login/widgets/password_text_field.widget.dart';
import 'package:tyba_restaurant/presentation/shared/loading/base.widget.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        )),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    LoginTextFieldWidget(),
                    const SizedBox(height: 10),
                    PasswordTextFieldWidget(),
                    const SizedBox(height: 20),
                    LoginButtonWidget(),
                    SizedBox(
                      height: 28,
                    ),
                    GestureDetector(
                      child: Text("No tienes cuenta? Registar"),
                      onTap: () {
                        Get.toNamed(Routes.SIGN_IN);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
