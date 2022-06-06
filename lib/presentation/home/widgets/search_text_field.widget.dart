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
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        hintText: 'Buscar Ciudad',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }
}
