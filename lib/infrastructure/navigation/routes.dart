import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';

class Routes {
  static Future<String> get initialRoute async {
    try {
      final authDomainService = AuthRepositoryBinding().repository;
      final isAuthenticated = await authDomainService.isAuthenticated();
      return isAuthenticated ? home : login;
    } catch (e) {
      return login;
    }
  }

  static const SIGN_IN = '/sign-in';
  static const home = '/home';
  static const login = '/login';
  static const SEARCH = '/search';
}
