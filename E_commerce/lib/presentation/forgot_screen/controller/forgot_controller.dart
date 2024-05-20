import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ForgotController extends GetxController{
  var isEmailValid = false.obs;
  RxBool obsecure = true.obs;
  final TextEditingController emailController = TextEditingController();

  void validateEmail(String value) {
    isEmailValid.value = value.contains('@gmail.com');
  }
  void clearEmail() {
    emailController.clear();
    isEmailValid.value = false;
  }




  final email = ''.obs;

  String? Validateemail(String value) {
    if (value.contains('@gmail.com')) {
      return null;
    }
    return'Not a valid email address. Should be your@email.com';
  }
}
