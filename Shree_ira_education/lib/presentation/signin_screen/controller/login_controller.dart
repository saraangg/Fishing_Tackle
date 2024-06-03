import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shree_ira_education/presentation/profile/Profile_page.dart';

class LoginController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var obscureText = true.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void login() async {
    final String email = emailController.text;
    final String password = passwordController.text;

    final response = await http.post(
      Uri.parse('http://axnoldigitalsolutions.in/Training/api/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      Get.to(() => ProfilePage(responseData: responseData));
    } else {
      Get.snackbar('Error', 'Login failed!', snackPosition: SnackPosition.BOTTOM);
    }
  }
}
