import 'package:tyba_restaurant/domain/auth/auth.repository.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/auth/auth.service.dart';

class AuthRepositoryBinding {
  late AuthRepository _authRepository;
  AuthRepository get repository => _authRepository;

  AuthRepositoryBinding() {
    final authService = AuthService();
    _authRepository = AuthRepository(authService: authService);
  }
}
