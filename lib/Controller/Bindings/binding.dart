import 'package:get/get.dart';
import 'package:timemanagment/Controller/auth_controller.dart';
import 'package:timemanagment/Controller/user_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());

  }

}