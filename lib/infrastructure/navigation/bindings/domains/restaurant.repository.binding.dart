import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/restaurant/restaurant.repository.dart';
import 'package:tyba_restaurant/infrastructure/dal/connect.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/restaurant/restaurant.service.dart';

class RestaurantRepositoryBinding {
  late RestaurantRepository _restaurantRepository;
  RestaurantRepository get repository => _restaurantRepository;

  RestaurantRepositoryBinding() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final restaurantService = RestaurantService(connect);
    _restaurantRepository =
        RestaurantRepository(restaurantService: restaurantService);
  }
}
