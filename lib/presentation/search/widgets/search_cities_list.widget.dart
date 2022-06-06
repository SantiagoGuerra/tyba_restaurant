import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';
import 'package:tyba_restaurant/presentation/home/home.screen.dart';
import 'package:tyba_restaurant/presentation/shared/loading/base.widget.dart';

class SearchCitiesListWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseWidget(
            child: ListView.builder(
          itemBuilder: ((context, index) {
            CityModel city = controller.cities[index];
            return ListTile(
              title: Text(city.address),
              leading: Icon(Icons.search),
              onTap: () {
                controller.getRestaurants(city.position.lat, city.position.lon);
                controller.citiesFromHistorial.add(city);
                controller.changeLocation(city);
                Get.to(() => HomeScreen(), binding: HomeControllerBinding());
              },
            );
          }),
          itemCount: controller.cities.length,
        )));
  }
}
