import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

part 'city.model.g.dart';

@JsonSerializable()
class CityModel {
  String address;
  PositionModel position;

  CityModel({required this.address, required this.position});

  factory CityModel.fromData(dynamic data) {
    return CityModel(address: data.address, position: data.position);
  }

  factory CityModel.fromJson(Map<String, dynamic> json) =>
      _$CityModelFromJson(json);

  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}

@JsonSerializable()
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

  factory PositionModel.fromJson(Map<String, dynamic> json) =>
      _$PositionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PositionModelToJson(this);
}
