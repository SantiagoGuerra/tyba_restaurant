import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';
import 'package:tyba_restaurant/presentation/screens.dart';

class SearchTextFieldWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        Get.to(() => SearchScreen(), binding: HomeControllerBinding());
      },

      // focusNode: controller.loginFocus,
      textInputAction: TextInputAction.search,

      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        hintText: 'Buscar Ciudad',
        hintStyle: Get.textTheme.headline6?.copyWith(color: Colors.black54),
      ),
    );
  }
}
