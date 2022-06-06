import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/controllers/controllers_bindings.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';
import 'package:tyba_restaurant/presentation/screens.dart';
import 'package:tyba_restaurant/presentation/shared/loading/base.widget.dart';

class HistoryCitiesListWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseWidget(
        child: controller.citiesFromHistorial.isNotEmpty
            ? ListView.builder(
                itemBuilder: ((context, index) {
                  CityModel city = controller.citiesFromHistorial[index];
                  return ListTile(
                    title: Text(city.address),
                    leading: Icon(Icons.access_time_rounded),
                    onTap: () {
                      city.save();
                      controller.getRestaurants(
                          city.position.lat, city.position.lon);
                      controller.changeLocation(city);
                      controller.isSearching.value = false;
                      Get.to(() => HomeScreen(),
                          binding: HomeControllerBinding());
                    },
                  );
                }),
                itemCount: controller.citiesFromHistorial.length,
              )
            : Center(
                child: Text("Historial Vacio"),
              )));
  }
}
