import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tyba_restaurant/domain/auth/auth.repository.dart';
import 'package:tyba_restaurant/domain/core/exceptions/user_not_found.exception.dart';
import 'package:tyba_restaurant/domain/core/utils/snackbar.util.dart';
import 'package:tyba_restaurant/infrastructure/navigation/routes.dart';
import 'package:tyba_restaurant/presentation/login/controllers/login.controller.dart';
import 'package:tyba_restaurant/presentation/shared/loading/loading.controller.dart';

class SignInController extends GetxController {
  final AuthRepository _authRepository;
  final _loadingController = Get.find<LoadingController>();
  SignInController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    ever<String>(email, validateLogin);
    ever<String>(password, validatePassword);
  }

  Future<void> signIn() async {
    try {
      _loadingController.isLoading = true;
      if (validateFields()) {
        Get.focusScope?.unfocus();

        await _authRepository.signIn(
          email: email.value,
          password: password.value,
        );

        Get.offAllNamed(Routes.home);
      }
    } on UserNotFoundException catch (err) {
      SnackbarUtil.showWarning(message: err.toString());
    } catch (err) {
      SnackbarUtil.showError(message: err.toString());
    } finally {
      _loadingController.isLoading = false;
    }
  }

  bool validateFields() {
    validateLogin(email.value);
    validatePassword(password.value);

    return email.isNotEmpty &&
        password.isNotEmpty &&
        loginError.value == null &&
        passwordError.value == null;
  }

  final email = ''.obs;
  final loginError = RxnString();
  final loginFocus = FocusNode();
  void validateLogin(String val) {
    if (val.isEmpty) {
      loginError.value = 'Escriba su correo';
    } else if (val.length < 3) {
      loginError.value = 'Correo invalido';
    } else {
      loginError.value = null;
    }
  }

  final password = ''.obs;
  final passwordError = RxnString();
  final passwordFocus = FocusNode();
  void validatePassword(String val) {
    if (val.isEmpty) {
      passwordError.value = 'Escriba su contrasena';
    } else if (val.length < 3) {
      passwordError.value = 'minimo 3 caracteres.';
    } else {
      passwordError.value = null;
    }
  }

  bool get enableButton =>
      email.isNotEmpty &&
      password.isNotEmpty &&
      loginError.value != null &&
      passwordError.value != null;
}
