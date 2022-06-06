import 'package:json_annotation/json_annotation.dart';

part 'restaurant.response.g.dart';

@JsonSerializable()
class RestaurantResponse {
  final SummaryResponse summary;
  final List<ResultResponse> results;
  final String? error;

  const RestaurantResponse({
    required this.summary,
    required this.results,
    this.error,
  });

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantResponseToJson(this);
}

@JsonSerializable()
class SummaryResponse {
  final String query;
  final String queryType;
  final int queryTime;
  final int numResults;
  final int offset;
  final int totalResults;
  final int fuzzyLevel;

  const SummaryResponse(
      {required this.query,
      required this.queryTime,
      required this.queryType,
      required this.numResults,
      required this.offset,
      required this.totalResults,
      required this.fuzzyLevel});

  factory SummaryResponse.fromJson(Map<String, dynamic> json) =>
      _$SummaryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryResponseToJson(this);
}

@JsonSerializable()
class ResultResponse {
  final String type;
  final String id;
  final PointOfInterestResponse poi;
  double? score;

  ResultResponse(
      {required this.type, required this.id, required this.poi, this.score});

  factory ResultResponse.fromJson(Map<String, dynamic> json) =>
      _$ResultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResultResponseToJson(this);
}

@JsonSerializable()
class PointOfInterestResponse {
  final String name;
  final List? categories;

  PointOfInterestResponse({required this.name, this.categories});

  factory PointOfInterestResponse.fromJson(Map<String, dynamic> json) =>
      _$PointOfInterestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PointOfInterestResponseToJson(this);
}
