import 'package:tyba_restaurant/domain/core/abstractions/http_connect.interface.dart';
import 'package:tyba_restaurant/domain/core/exceptions/default.exception.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/city/dto/city.response.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/restaurant/dto/restaurant.response.dart';

class CityService {
  final IHttpConnect _connect;
  const CityService(IHttpConnect connect) : _connect = connect;

  String get _url => '';

  Future<CityResponse> getCities(String city) async {
    final response = await _connect.get(
      'https://api.tomtom.com/search/2/geocode/$city.json?key=uSpRmHhkyhFDgxNCgAJy3iphZeGtPN8p&countrySet=CO&score=1',
      decoder: (value) => CityResponse.fromJson(
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
