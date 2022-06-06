import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/core/abstractions/http_connect.interface.dart';
import 'package:tyba_restaurant/domain/core/abstractions/response.model.dart'
    as abs;

class Connect implements IHttpConnect {
  final GetConnect _connect;
  const Connect({required GetConnect connect}) : _connect = connect;

  @override
  Future<abs.Response<T>> get<T>(String url,
      {required T Function(dynamic)? decoder}) async {
    final response = await _connect.get(url, decoder: decoder);
    final obj =
        abs.Response(statusCode: response.statusCode!, payload: response.body);
    return obj;
  }
}
