import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/city/city.service.dart';

class CityRepository {
  final CityService _cityService;

  CityRepository({
    required CityService cityService,
  }) : _cityService = cityService;

  Future<List<CityModel>> getCities(String city) async {
    try {
      final response = await _cityService.getCities(city);
      List<CityModel> list = response.results
          .map((e) => CityModel(
              address: e.address.freeformAddress,
              position: PositionModel.fromData(e.position)))
          .toList();

      return list;
    } catch (e) {
      rethrow;
    }
  }
}
