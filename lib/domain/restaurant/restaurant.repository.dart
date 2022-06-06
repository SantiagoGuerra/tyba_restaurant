import 'package:tyba_restaurant/domain/restaurant/models/restaurant.model.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/restaurant/restaurant.service.dart';

class RestaurantRepository {
  final RestaurantService _restaurantService;

  RestaurantRepository({
    required RestaurantService restaurantService,
  }) : _restaurantService = restaurantService;

  Future<List<RestaurantModel>> getRestaurants(double lat, double lon) async {
    try {
      final response = await _restaurantService.getRestaurantList(lat, lon);
      List<RestaurantModel> list = response.results
          .map((e) => RestaurantModel(
              name: e.poi.name, categories: e.poi.categories, score: e.score))
          .toList();
      return list;
    } catch (e) {
      rethrow;
    }
  }
}
