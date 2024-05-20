import 'package:deals_dray/presentation/SplashScreen/splash_controller.dart';
import 'package:get/get.dart';


class Splashbinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }

}