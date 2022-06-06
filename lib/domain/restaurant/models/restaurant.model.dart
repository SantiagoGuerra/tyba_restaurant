import 'package:tyba_restaurant/infrastructure/dal/services/data/restaurant.data.dart';

class RestaurantModel {
  String name;
  String? phone, photoUrl;
  double? score;
  List? categories;

  RestaurantModel(
      {required this.name,
      this.categories,
      this.phone,
      this.photoUrl,
      this.score});

  factory RestaurantModel.fromData(RestaurantData data) {
    return RestaurantModel(
        name: data.name,
        categories: data.categories,
        phone: data.phone,
        photoUrl: data.photoUrl,
        score: data.score);
  }
}
