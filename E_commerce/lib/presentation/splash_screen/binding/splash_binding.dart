import 'package:get/get.dart';

import '../controller/splash_controller.dart';

class splashbinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut<splashcontroller>(() => splashcontroller());
  }

}