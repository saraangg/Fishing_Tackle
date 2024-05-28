
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../app_routes.dart';
import '../home/Text_with_image.dart';

class WelcomeController extends GetxController{
  @override
  void onInit(){
    super.onInit();
    _init();
  }
  Future<void>_init()async{
    await Future.delayed(
      Duration(seconds: 5),
    );
    Get.offNamed(AppRoutes.SignUp);
  }
}