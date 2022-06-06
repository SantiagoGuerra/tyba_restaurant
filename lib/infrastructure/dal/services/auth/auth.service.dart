import 'package:firebase_auth/firebase_auth.dart';
import 'package:tyba_restaurant/domain/core/exceptions/default.exception.dart';
import 'package:tyba_restaurant/domain/core/exceptions/user_not_found.exception.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/auth/dto/authenticate_user.body.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/auth/dto/authenticate_user.response.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/data/user.data.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<AuthenticateUserResponse> login(
    AuthenticateUserBody body,
  ) async {
    String email = body.email;
    String password = body.password;
    final response = await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    if (response.user != null) {
      UserData user = UserData(
        uid: response.user!.uid,
        displayName: response.user!.displayName,
        email: response.user!.email!,
      );
      DataResponse data = DataResponse(user: user);
      return AuthenticateUserResponse(
        success: true,
        data: data,
      );
    } else {
      throw UserNotFoundException();
    }
  }

  Future<AuthenticateUserResponse> createUser(AuthenticateUserBody body) async {
    String email = body.email;
    String password = body.password;
    final response = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    if (response.user != null) {
      UserData user = UserData(
        uid: response.user!.uid,
        displayName: response.user!.displayName,
        email: response.user!.email!,
      );
      DataResponse data = DataResponse(user: user);
      return AuthenticateUserResponse(
        success: true,
        data: data,
      );
    } else {
      throw DefaultException();
    }
  }

  Future<void> logout() async {
    _firebaseAuth.signOut().catchError((_) {
      throw DefaultException();
    });
  }
}
