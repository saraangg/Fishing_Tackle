import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Log_controller extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailField = FocusNode();
  final FocusNode passwordField = FocusNode();
  final RxBool obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }
}