import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/city/city.repository.dart';
import 'package:tyba_restaurant/infrastructure/dal/connect.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/city/city.service.dart';

class CityRepositoryBinding {
  late CityRepository _cityRepository;
  CityRepository get repository => _cityRepository;

  CityRepositoryBinding() {
    final getConnect = Get.find<GetConnect>();
    final connect = Connect(connect: getConnect);
    final cityService = CityService(connect);
    _cityRepository = CityRepository(cityService: cityService);
  }
}
