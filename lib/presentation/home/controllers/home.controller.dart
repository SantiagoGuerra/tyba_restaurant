import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:tyba_restaurant/db.dart';
import 'package:tyba_restaurant/domain/auth/auth.repository.dart';
import 'package:tyba_restaurant/domain/city/city.repository.dart';
import 'package:tyba_restaurant/domain/city/models/city.model.dart';
import 'package:tyba_restaurant/domain/restaurant/models/restaurant.model.dart';
import 'package:tyba_restaurant/domain/restaurant/restaurant.repository.dart';
import 'package:tyba_restaurant/infrastructure/navigation/routes.dart';

class HomeController extends GetxController {
  final _storage = Get.find<GetStorage>();

  final AuthRepository _authRepository;
  final RestaurantRepository _restaurantRepository;
  final CityRepository _cityRepository;
  HomeController(
      {required AuthRepository authRepository,
      required RestaurantRepository restaurantRepository,
      required CityRepository cityRepository})
      : _authRepository = authRepository,
        _restaurantRepository = restaurantRepository,
        _cityRepository = cityRepository;
  @override
  void onInit() {
    super.onInit();
    ever<String>(city, validateSearch);
    determinePosition();
    getRestaurants(lat.value, lon.value);
    getCitiesFromHistorial();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  Rx<bool> isSearching = false.obs;
  RxList<CityModel> cities = <CityModel>[].obs;
  RxList<CityModel> citiesFromHistorial = <CityModel>[].obs;
  RxList<RestaurantModel> restaurants = <RestaurantModel>[].obs;
  Rx<double> lat = 0.0.obs;
  Rx<double> lon = 0.0.obs;
  final currentLocation = Rxn<CityModel>();

  var city = "".obs;

  Future<void> logout() async {
    _authRepository.logout();
    Get.offAllNamed(Routes.login);
  }

  Future<List<RestaurantModel>> getRestaurants(double lat, double lon) async {
    List<RestaurantModel> restaurantList =
        await _restaurantRepository.getRestaurants(lat, lon);
    restaurants(restaurantList);
    getCitiesFromHistorial();

    return restaurantList;
  }

  Future<void> getCities() async {
    cities.value = await _cityRepository.getCities(city.value);
  }

  Future<void> getCitiesFromHistorial() async {
    citiesFromHistorial.value = await DB.getCities();
  }

  void validateSearch(String val) {
    if (val.isEmpty) {
      isSearching.value = false;
    } else {
      isSearching.value = true;
    }
  }

  void changeLocation(CityModel city) {
    currentLocation.value = city;
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    lat(position.latitude);
    lon(position.longitude);

    print(position.heading);

    return position;
  }
}
