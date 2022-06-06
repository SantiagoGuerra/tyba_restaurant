import 'package:get/get.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/city.repository.binding.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/restaurant.repository.binding.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    final AuthRepositoryBinding authRepositoryBinding = AuthRepositoryBinding();
    final RestaurantRepositoryBinding restaurantRepositoryBinding =
        RestaurantRepositoryBinding();
    final CityRepositoryBinding cityRepositoryBinding = CityRepositoryBinding();

    Get.lazyPut<HomeController>(
      () => HomeController(
          authRepository: authRepositoryBinding.repository,
          restaurantRepository: restaurantRepositoryBinding.repository,
          cityRepository: cityRepositoryBinding.repository),
    );
  }
}
