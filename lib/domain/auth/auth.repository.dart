import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tyba_restaurant/db.dart';
import 'package:tyba_restaurant/domain/auth/models/user.model.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/auth/auth.service.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';

class AuthRepository {
  final AuthService _authService;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _storage = Get.find<GetStorage>();

  AuthRepository({
    required AuthService authService,
  }) : _authService = authService;

  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final body = AuthenticateUserBody(email: email, password: password);
      final response = await _authService.login(body);
      final user = UserModel.fromData(response.data!.user);

      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final body = AuthenticateUserBody(email: email, password: password);
      final response = await _authService.createUser(body);
      final user = UserModel.fromData(response.data!.user);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      return _firebaseAuth.currentUser != null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _authService.logout();
      await _storage.erase();
      await DB.clean();
    } catch (e) {
      rethrow;
    }
  }
}
