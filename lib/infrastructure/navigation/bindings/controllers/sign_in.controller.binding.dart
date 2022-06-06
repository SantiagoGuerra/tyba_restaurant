import 'package:get/get.dart';
import 'package:tyba_restaurant/infrastructure/navigation/bindings/domains/auth.repository.binding.dart';

import '../../../../presentation/sign_in/controllers/sign_in.controller.dart';

class SignInControllerBinding extends Bindings {
  @override
  void dependencies() {
    final AuthRepositoryBinding authRepositoryBinding = AuthRepositoryBinding();

    Get.lazyPut<SignInController>(() =>
        SignInController(authRepository: authRepositoryBinding.repository));
  }
}
