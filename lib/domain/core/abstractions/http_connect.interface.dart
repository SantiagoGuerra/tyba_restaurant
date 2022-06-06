import 'package:tyba_restaurant/domain/core/abstractions/response.model.dart';

abstract class IHttpConnect {
  Future<Response<T>> get<T>(
    String url, {
    required T Function(dynamic)? decoder,
  });
}
