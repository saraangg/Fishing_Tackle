import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SplashController extends GetxController{
  @override
  void onInit(){
    super.onInit();
    _init();
  }
  Future<void>_init()async{
    await Future.delayed(
      Duration(seconds: 5),
    );
    Get.offNamed('/home');
  }
}