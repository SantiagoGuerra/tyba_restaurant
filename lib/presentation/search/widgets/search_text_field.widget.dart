import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/infrastructure/navigation/routes.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';

class SearchTextFieldWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) async {
        controller.city.value = value;
        await controller.getCities();
      },
      // focusNode: controller.loginFocus,
      textInputAction: TextInputAction.search,
      onFieldSubmitted: (_) async {
        controller.city.value = "";
        await controller.getCities();
      },
      decoration: InputDecoration(
        hintText: 'Buscar Ciudad',
        hintStyle: Get.textTheme.headline6?.copyWith(color: Colors.black54),
      ),
    );
  }
}
