import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/shared/loading/base.widget.dart';
import 'package:tyba_restaurant/presentation/sign_in/widgets/password_text_field.widget.dart';
import 'package:tyba_restaurant/presentation/sign_in/widgets/sign_text_field.widget.dart';
import 'package:tyba_restaurant/presentation/sign_in/widgets/signin_button.widget.dart';

import 'controllers/sign_in.controller.dart';

class SignInScreen extends GetView<SignInController> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Registrarse"),
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
                    SignInTextFieldWidget(),
                    const SizedBox(height: 10),
                    PasswordTextFieldWidget(),
                    const SizedBox(height: 20),
                    SignInButtonWidget(),
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
