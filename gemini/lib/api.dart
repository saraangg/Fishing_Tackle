import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_routes.dart';

class LoginApi extends GetxController {
  get http => null;

  Future<void> login({required String email, required String password}) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text('Please Enter Username and Password'),
            backgroundColor: Colors.blueGrey.shade500,
          ),
        );
        return;
      }

      String apiUrl = 'https://fakestoreapi.com/auth/login';

      // Data to be sent in the request body
      Map<String, String> data = {
        'username': email,
        'password': password,
      };

      // Make the POST request
      var response = await http.post(Uri.parse(apiUrl), body: data);

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response JSON
        var responseData = json.decode(response.body);

        // Extract the token from the response
        String? token = responseData['token'];

        // Check if token is not null
        if (token != null) {
          // Now you can use this token for subsequent API requests
          print('Token: $token');
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          // Get.offNamed(AppRoutes.HomePage); // Use Get.offNamed to replace current route
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text("Successfully Logged in"),
              backgroundColor: Colors.blueGrey.shade500,
            ),
          );
        } else {
          // Token is null
          print('Token is null');
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text("Some error occurred"),
              backgroundColor: Colors.blueGrey.shade500,
            ),
          );
        }
      } else {
        // Request failed with a non-200 status code
        print('Failed with status code: ${response.statusCode}');
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            content: Text("Failed with status code: ${response.statusCode}"),
            backgroundColor: Colors.blueGrey.shade500,
          ),
        );
      }
    } catch (error) {
      // Request failed due to an error
      print('Error: $error');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(
          content: Text('Error occurred: $error'),
          backgroundColor: Colors.blueGrey.shade500,
        ),
      );
    }
  }
}