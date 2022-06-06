import 'package:json_annotation/json_annotation.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/data/user.data.dart';

part 'authenticate_user.response.g.dart';

@JsonSerializable()
class AuthenticateUserResponse {
  final bool success;
  final DataResponse? data;
  final String? error;

  const AuthenticateUserResponse({
    required this.success,
    required this.data,
    this.error,
  });
}

@JsonSerializable()
class DataResponse {
  final UserData user;

  const DataResponse({required this.user});

  factory DataResponse.fromJson(Map<String, dynamic> json) =>
      _$DataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataResponseToJson(this);
}
