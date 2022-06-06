import 'package:json_annotation/json_annotation.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/data/user.data.dart';

part 'city.response.g.dart';

@JsonSerializable()
class CityResponse {
  final List<ResultResponse> results;
  final String? error;
  const CityResponse({required this.results, this.error});

  factory CityResponse.fromJson(Map<String, dynamic> json) =>
      _$CityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CityResponseToJson(this);
}

@JsonSerializable()
class ResultResponse {
  final AddressResponse address;
  final PositionResponse position;

  ResultResponse({required this.address, required this.position});

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}

@JsonSerializable()
class AddressResponse {
  final String freeformAddress;

  const AddressResponse({required this.freeformAddress});

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class PositionResponse {
  final double lat;
  final double lon;

  const PositionResponse({required this.lat, required this.lon});

  factory PositionResponse.fromJson(Map<String, dynamic> json) =>
      _$PositionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PositionResponseToJson(this);
}
