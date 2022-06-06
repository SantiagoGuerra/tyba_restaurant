import 'package:tyba_restaurant/db.dart';

class CityModel {
  String address;
  PositionModel position;

  CityModel({required this.address, required this.position});

  factory CityModel.fromData(dynamic data) {
    return CityModel(address: data.address, position: data.position);
  }

  Map<String, dynamic> toMap() {
    return {'address': address, 'lat': position.lat, 'lon': position.lon};
  }

  Future<void> save() async {
    CityModel city = CityModel(address: address, position: position);
    await DB.insert(city);
  }

  Future<List<CityModel>> getCities() async {
    return DB.getCities();
  }
}

class PositionModel {
  double lat;
  double lon;

  PositionModel({
    required this.lat,
    required this.lon,
  });

  factory PositionModel.fromData(dynamic data) {
    return PositionModel(lat: data.lat, lon: data.lon);
  }
}
