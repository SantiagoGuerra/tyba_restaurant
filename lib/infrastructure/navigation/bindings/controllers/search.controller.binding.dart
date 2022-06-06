import 'package:get/get.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/restaurant.repository.binding.dart';

import '../../../../presentation/search/controllers/search.controller.dart';

class SearchControllerBinding extends Bindings {
  @override
  void dependencies() {
    final RestaurantRepositoryBinding restaurantRepositoryBinding =
        RestaurantRepositoryBinding();
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
  }
}
