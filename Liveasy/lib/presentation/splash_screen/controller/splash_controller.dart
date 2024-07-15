import 'package:get/get.dart';

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
    Get.offNamed('/welcome');
  }
}