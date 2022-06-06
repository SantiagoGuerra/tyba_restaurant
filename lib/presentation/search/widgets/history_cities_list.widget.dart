import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';
import 'package:tyba_restaurant/presentation/shared/loading/base.widget.dart';

class HistoryCitiesListWidget extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => BaseWidget(
            child: ListView.builder(
          itemBuilder: ((context, index) {
            CityModel city = controller.citiesFromHistorial[index];
            return ListTile(
              title: Text(city.address),
              leading: Icon(Icons.search),
              onTap: () {
                print(city.position.lat);
                print(city.position.lon);
              },
            );
          }),
          itemCount: controller.citiesFromHistorial.length,
        )));
  }
}
