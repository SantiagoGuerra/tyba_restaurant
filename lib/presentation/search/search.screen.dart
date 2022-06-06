import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tyba_restaurant/infrastructure/theme/theme.dart';
import 'package:tyba_restaurant/presentation/home/controllers/home.controller.dart';
import 'package:tyba_restaurant/presentation/search/widgets/history_cities_list.widget.dart';
import 'package:tyba_restaurant/presentation/search/widgets/search_cities_list.widget.dart';
import 'package:tyba_restaurant/presentation/search/widgets/search_text_field.widget.dart';

import 'controllers/search.controller.dart';

class SearchScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: SearchTextFieldWidget(),
          centerTitle: false,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: themeData.primaryColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: Obx(() => controller.isSearching.value
            ? SearchCitiesListWidget()
            : HistoryCitiesListWidget()));
  }
}
