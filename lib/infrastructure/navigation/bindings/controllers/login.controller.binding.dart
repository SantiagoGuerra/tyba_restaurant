import 'package:get/instance_manager.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';
import 'package:tyba_restaurant/presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    final AuthRepositoryBinding authRepositoryBinding = AuthRepositoryBinding();

    Get.lazyPut<LoginController>(() =>
        LoginController(authRepository: authRepositoryBinding.repository));
  }
}
