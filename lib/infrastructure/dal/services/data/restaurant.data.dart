import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant.data.g.dart';

@JsonSerializable()
class RestaurantData {
  final String name;
  final phone, photoUrl;
  final double? score;
  final List? categories;

  RestaurantData(
      {required this.name,
      this.categories,
      this.phone,
      this.photoUrl,
      this.score});

  factory RestaurantData.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDataFromJson(json);

  Map<String, dynamic> toJson() => _$RestaurantDataToJson(this);
}
