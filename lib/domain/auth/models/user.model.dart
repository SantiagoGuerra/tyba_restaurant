import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tyba_restaurant/infrastructure/dal/services/data/user.data.dart';

class UserModel {
  final String uid, email;
  final String? displayName;

  const UserModel({required this.uid, required this.email, this.displayName});

  factory UserModel.fromData(UserData data) {
    return UserModel(
        uid: data.uid, email: data.email, displayName: data.displayName);
  }

  static UserModel? fromStorage() {
    final storage = Get.find<GetStorage>();
    final user = storage.read<UserModel>('user');
    return user;
  }
}
