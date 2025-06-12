import 'package:get/get.dart';

import 'auth_controller.dart';

class MyBindings implements Bindings{
  @override
  void dependencies() {
   Get.put(AuthController());
  }
  
}