import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/domain/restaurant/models/restaurant.model.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';
import 'package:tyba_restaurant/presentation/shared/loading/base.widget.dart';

class RestaurantListWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseWidget(
            child: ListView.builder(
          itemBuilder: ((context, index) {
            RestaurantModel restaurant = controller.restaurants[index];
            return ListTile(
              title: Text(restaurant.name),
              leading: Icon(Icons.food_bank_outlined),
              subtitle: Text(restaurant.categories!.join(", ")),
              onTap: () {},
            );
          }),
          itemCount: controller.restaurants.length,
        )));
  }
}
