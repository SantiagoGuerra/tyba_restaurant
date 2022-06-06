import 'package:tyba_restaurant/domain/core/abstractions/http_connect.interface.dart';
import 'package:tyba_restaurant/domain/core/exceptions/default.exception.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/restaurant/dto/restaurant.response.dart';

class RestaurantService {
  final IHttpConnect _connect;
  const RestaurantService(IHttpConnect connect) : _connect = connect;

  String get _url =>
      'https://api.tomtom.com/search/2/categorySearch/restaurant.json?key=uSpRmHhkyhFDgxNCgAJy3iphZeGtPN8p&limit=10';

  Future<RestaurantResponse> getRestaurantList(double lat, double lon) async {
    final response = await _connect.get(
      'https://api.tomtom.com/search/2/categorySearch/restaurant.json?key=uSpRmHhkyhFDgxNCgAJy3iphZeGtPN8p&limit=10&lat=$lat&lon=$lon',
      decoder: (value) => RestaurantResponse.fromJson(
        value as Map<String, dynamic>,
      ),
    );

    if (response.success) {
      return response.payload!;
    } else {
      switch (response.statusCode) {
        default:
          throw DefaultException(message: response.payload!.error!);
      }
    }
  }
}
