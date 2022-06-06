import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/presentation/home/widgets/restaurant_list.widget.dart';
import 'package:tyba_restaurant/presentation/home/widgets/search_text_field.widget.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchTextFieldWidget(),
        actions: [
          IconButton(
              onPressed: () async {
                await controller.logout();
              },
              icon: Icon(Icons.logout))
        ],
        centerTitle: true,
      ),
      body: Center(
        child: RestaurantListWidget(),
      ),
    );
  }
}
