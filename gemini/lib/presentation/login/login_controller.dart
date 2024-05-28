import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> keyForm = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailField = FocusNode();
  final FocusNode passwordField = FocusNode();
  final RxBool obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  Future<void> login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Get.offNamed('/textwithimage');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
