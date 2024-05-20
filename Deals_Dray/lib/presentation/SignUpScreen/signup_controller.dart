import 'package:deals_dray/constants/usermodels.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralCodeController = TextEditingController();

  var isEmailValid = false.obs;
  var isPasswordValid = false.obs;
  var obscurePassword = true.obs; // Added to toggle password visibility

  void validateEmail(String value) {
    isEmailValid.value = value.endsWith('@gmail.com') || value.endsWith('@gmail.con') || value.isEmpty;
  }



  void validatePassword(String value) {
    isPasswordValid.value  = value.length >= 8 &&
        value.contains(RegExp(r'[a-z]')) &&
        value.contains(RegExp(r'[A-Z]')) &&
        value.contains(RegExp(r'[0-9]')) || value.isEmpty;
  }



  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  final formKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      // Get values from controllers
      String email = emailController.text;
      String password = passwordController.text;
      String referralCode = referralCodeController.text;

      // Call your API for user registration
      // Example:
      // var response = await api.register(email, password, referralCode);

      // Simulating API call with a delay
      await Future.delayed(Duration(seconds: 2));

      // Check API response and handle accordingly
      // For simplicity, assume registration is successful
      UserModel userModel = UserModel();
      userModel.emailAddress = email;

      // Navigate to next screen
      // Get.toNamed(AppRoutes.Bottomnav);
    }
  }
}
