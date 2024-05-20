import 'package:get/get.dart';

class WelcomeController extends GetxController{
  void onIntroDone(){
    Get.offNamed('/login');
  }
}