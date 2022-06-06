import 'package:logger/logger.dart';

class UserNotFoundException implements Exception {
  final String message;
  UserNotFoundException({this.message = "El usuario no ha sido encontrado"}) {
    Logger().w(message);
  }

  @override
  String toString() => message;
}
